#!/usr/bin/env lua

-- contexto:	Listar y eliminar comentarios de script usando plugin

-- objetivo:	Plugin de Lua para Neovim que lista todos los comentarios 
-- 		que empiezan por '#' en un script de Python
-- 		Distinguiendo entre comentarios de línea completa y de final de línea

-- procesos:	Usa dos tablas:
-- 			comentario_completo
-- 			comentario_final
-- 			

-- uso     	Guarda comments_plugin.lua en tu directorio de configuración de Neovim 
-- 			(~/.config/nvim/lua/comments_plugin.lua)
-- 		Carga el plugin en tu init.lua:
--			Agrega la siguiente línea a tu init.lua:
--				require('comments_plugin')
-- 		Crea un comando de Neovim:
--		En tu init.lua, crear un comando personalizado para llamar fácilmente a la función:
--			vim.api.nvim_create_user_command(
--				'Lista_Comentarios',
--			function()
--				require('comments_plugin').list_python_comments()
--			end,
--			{
--				desc = 'Listar todos los comentarios de Python en el búfer actual',
--				buffer = 0, -- Hacer que el comando esté disponible en todos los búferes
--				-- Agregar `filetype = 'python'` si solo para archivos de Python
--			}
--			)	

local M = {}

function M.list_python_comments()
    -- Obtiene el ID del buffer actual. 
    local buf = vim.api.nvim_get_current_buf()
    -- Recupera todas las líneas del buffer actual
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

    local comentario_completo = {}
    local comentario_final = {}

    for i, line in ipairs(lines) do
        -- Check for full-line comments (not indented)
        --if line:match("^%s*#") and not line:match("^%s%s*#") then
        if line:match("^%s*#") then
	    -- Error: attempt to call method 'trim' (a nil value)
            table.insert(comentario_completo, string.format("Line %d: %s", i, line))
	
        -- Check for end-of-line comments (indented by non-whitespace characters)
        elseif line:match("[^%s]#") then
            local comment_start = line:find("#", 1, true)
            if comment_start then
                table.insert(comentario_final, string.format("Line %d: %s", i, line:sub(comment_start)))
            end
        end
    end

    print("--- Listado de Comentarios ---")
    if #comentario_completo > 0 then
        print("\nComentarios de linea completa:")
        for _, comment in ipairs(comentario_completo) do
            print(comment)
        end
    else
        print("\nNo hay comentarios de linea completa")
    end

    if #comentario_final > 0 then
        print("\nComentarios al final de la linea:")
        for _, comment in ipairs(comentario_final) do
            print(comment)
        end
    else
        print("\nNo hay comentarios al final de la linea")
    end
    print("-----------------------")
end

return M

