#!/usr/bin/env lua

-- contexto:	plugin hecho en casa y con comando asociado

-- objetivo:	Analisis de frecuencia palabras solo para codigo Lua

-- procesos:	Leer el contenido del buffer actual:
-- 			Remover comentarios
-- 		Las líneas se unen en una sola cadena, separadas por caracteres de nueva línea
-- 		Analisis de frecuencias de palabras
-- 			Iterar sobre las palabras del texto
-- 		Ordena por frecuencia en forma desendente en nueva tabla
--
-- 		Neovim interace:
-- 		Display the results in a new Neovim buffer
-- 			Escribe el titulo
-- 			Escribe palabra y frecuencia

-- 		Colocar la logica del plugin en folder lua/
-- 			Ejecutar manualmente	:luafile word_freq.lua
-- 			Usar vim.cmd() para crear un comando que aproveche el comando luafile

-- Leer el contenido del buffer actual, buffer 0
local buffer_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)

local function removeComments(codeLines)
	-- Entrada tabla codeLines y salida tabla outputLines con código sin comentarios
	local outputLines = {}
	-- Itera a través de cada línea de la tabla codeLines de entrada
	for _, line in ipairs(codeLines) do
		local newLine = line
		-- No encontro el doble dash, inserta la linea en la salida
		if string.find(newLine, "--", 1, true) == nil then
			table.insert(outputLines, newLine)
		end
	end
	return outputLines
end

local cleanedCode = removeComments(buffer_content)

--function printArgs(...)
--    for i, v in ipairs({...}) do
--        print("Elemento: " .. i .. ": " .. v)
--    end
--end
--printArgs(unpack(buffer_content))

-- Las líneas se unen en una sola cadena, separadas por caracteres de nueva línea
local text = table.concat(cleanedCode, "\n")

-- [[ Esta es una comprobación simple para identificar posibles nombres de variables
-- Es una heurística básica.
-- 	Una detección de variables más robusta requeriría expresiones regulares más sofisticados
-- 	para distinguir variables de palabras clave, nombres de funciones, etc ]]
local function is_variable(word)
	-- Busca palabras que comiencen con un carácter alfanumérico o un guion bajo,
	-- seguido de cualquier número de caracteres alfanuméricos o guiones bajos
	return word:match("^[a-zA-Z_][a-zA-Z0-9_]*$")
end

-- Analisis de frecuencias de palabras
local word_frequencies = {}

-- Iterar sobre las palabras del texto
-- string.gmatch() devuelve un iterador para encontrar todas las coincidencias,
-- que se usa normalmente en un bucle for.
for word in text:gmatch("([a-zA-Z_][a-zA-Z0-9_]*)") do
	-- Convert to lowercase for case-insensitive counting
	--local lower_word = word:lower()
	local lower_word = word

	-- Comprueba con funcion si la palabra extraída es probale una variable.
	if is_variable(lower_word) then
		-- Esta expresión idiomatica se usa para inicializar un contador
		-- La variable está diseñada para contar ocurrencias y podría no existir inicialmente,
		-- esto garantiza que comience en 0 antes del primer incremento
		word_frequencies[lower_word] = (word_frequencies[lower_word] or 0) + 1
	end
end

-- Ordena por frecuencia en forma desendente en nueva tabla
local sorted_frequencies = {}
for word, count in pairs(word_frequencies) do
	table.insert(sorted_frequencies, { word = word, count = count })
end

table.sort(sorted_frequencies, function(a, b)
	return a.count > b.count
end)

-- Neovim interface
-- Display the results in a new Neovim buffer
vim.cmd("vsplit")
vim.cmd("enew")
vim.cmd("setlocal buftype=nofile bufhidden=wipe nobuflisted nospell nonumber norelativenumber foldcolumn=0")
vim.cmd("file WordFrequencyAnalysis")
vim.api.nvim_buf_set_option(0, "modifiable", true)
-- Escribe el titulo
vim.api.nvim_buf_set_lines(0, 0, -1, false, { "Analisis de frecuencia:" })
vim.api.nvim_buf_set_lines(0, 1, -1, false, { "-----------------------------------" })
-- Escribe palabra y frecuencia
local line_num = 2
if #sorted_frequencies == 0 then
	vim.api.nvim_buf_set_lines(0, line_num, -1, false, { "No variables found." })
else
	for _, entry in ipairs(sorted_frequencies) do
		vim.api.nvim_buf_set_lines(0, line_num, -1, false, { string.format("%s: %d", entry.word, entry.count) })
		line_num = line_num + 1
	end
end

vim.api.nvim_buf_set_option(0, "modifiable", false)
