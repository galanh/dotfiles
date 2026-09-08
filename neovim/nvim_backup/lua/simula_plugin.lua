#!/usr/bin/env lua

-- objetivo:	Simular el procesamiento de especificaciones enviadas al plugin de Neovim
-- ejecucion:	init.lua llama a setup() y le pasa una tabla de configuraciones del usuario
-- 			- Varios display muestran la secuencia de ejecucion
-- 			- Se realizan procesos de validacion automaticos

-- instalar:    Guarda la logica del plugin en tu configuración de Neovim: 
-- 			~/.config/nvim/lua/simula_plugin.lua
-- 			Cambiar el original en:
-- 			~/bin/simula_plugin.lua
-- 		Exponer la funcionalidad en ini.lua:
--			require('simula_plugin')

-- procesos:	La logica de la simulacion tiene dos funciones en la tabla de salida:
-- 			- setup(user_config): Punto de entrada del complemento
-- 			Esta función normalmente es llamada por el init.lua del usuario.
-- 			- parse_tables(config_tables) Llamada dentro de setup()
-- 			Itera a través de las tablas de configuración proporcionadas por el usuario.
-- 			Analiza las tablas de configuración 
-- 			y extrae las especificaciones relevantes.

local M = {}

-- Almacena la configuración del plugin, incluidos los valores predeterminados.
M.config = {
    my_tables = {},
    -- Other potential configuration options
}

-- parse_tables(config_tables): Itera a través de las tablas de configuración proporcionadas por el usuario.
-- Analiza las tablas de configuración y extrae las especificaciones relevantes.
-- Para cada entrada, realiza una validación (comprueba si el nombre y la ruta son cadenas y están presentes).
-- Extrae el nombre, la ruta, habilitado (el valor predeterminado es verdadero) y datos personalizados.
-- Utiliza vim.notify para informar al usuario sobre entradas no válidas sin bloquear el sistema.
-- "goto continue" se utiliza para pasar a la siguiente iteración en caso de una entrada no válida.
-- Devuelve una tabla de especificaciones analizadas que contiene solo los datos válidos y extraídos.
-- 	@param config_tables Una lista de tablas proporcionadas por el usuario en la configuración.
local function parse_tables(config_tables)
    local parsed_specifications = {}

    if not config_tables or type(config_tables) ~= 'table' then
        vim.notify("Configuración no válida para 'my_tables'. Se esperaba una lista de tablas", vim.log.levels.WARN)
        return parsed_specifications
    end

    for i, table_entry in ipairs(config_tables) do
        if type(table_entry) ~= 'table' then
            vim.notify(string.format("Entrada no válida en el índice %d de 'mis_tablas' se esperaba tabla", i), vim.log.levels.WARN)
            goto continue
        end

        local name = table_entry.name
        local path = table_entry.path
        local enabled = table_entry.enabled ~= false -- Default to true if not specified or nil
        local custom_data = table_entry.custom_data -- Optional custom data

        if not name or type(name) ~= 'string' then
            vim.notify(string.format("Entrada en el índice %d en 'my_tables' le falta una cadena 'name' válida", i), vim.log.levels.WARN)
            goto continue
        end

        if not path or type(path) ~= 'string' then
            vim.notify(string.format("Entrada en el índice %d en 'my_tables' le falta una cadena 'path' válida", i), vim.log.levels.WARN)
            goto continue
        end

        table.insert(parsed_specifications, {
            name = name,
            path = path,
            enabled = enabled,
            custom_data = custom_data,
        })

        ::continue::
    end

    return parsed_specifications
end

-- M.setup(user_config): Punto de entrada del complemento
-- Esta función normalmente es llamada por el `init.lua` del usuario.
-- 	vim.tbl_deep_extend("force", M.config, user_config or {}):
-- 	Esta función de utilidad de Neovim fusiona user_config con M.config, 
-- 	lo que permite a los usuarios anular la configuración predeterminada.
-- 	Llama a parse_tables con la función my_tables proporcionada por el usuario de la configuración fusionada.
-- Los datos analizados se almacenan en M.parsed_specifications para uso interno del complemento.
-- Una sentencia de impresión muestra cómo se usarían o reportarían los datos analizados.
-- 	@param user_config A table containing user-defined configuration.
function M.setup(user_config)
    print(" ***** Entro al setup() *****")

    -- Merge user_config into default config
    M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

    -- setup() llama parse_tables()
    local parsed_data = parse_tables(M.config.my_tables)

    -- Store the parsed data for later use within the plugin
    M.parsed_specifications = parsed_data

    -- Ahora puedes usar `M.parsed_specifications` para la lógica del complemento.
    print(" ***** Las Especificaciones o salida de parse_table() *****")

    if #parsed_data > 0 then
	print("simula_plugin: Especificaciones analizadas correctamente:")    
        for _, spec in ipairs(parsed_data) do
            print(string.format(" - Nombre: %s, Ruta: %s, \t\t\tHabilitado: %s", spec.name, spec.path, tostring(spec.enabled)))
            if spec.custom_data then
                print(string.format(" - Dato personalizado: %s", vim.inspect(spec.custom_data)))
            end
        end
    else
	print("simula_plugin: No se analizaron especificaciones o todas eran inválidas.")
    end

    -- La sección comentada muestra cómo se pueden registrar comandos de Neovim 
    -- según las especificaciones analizadas en un complemento real.
    -- Example: Register a command based on parsed data (in a real plugin)
    -- for _, spec in ipairs(M.parsed_specifications) do
    --     if spec.enabled then
    --         vim.api.nvim_create_user_command("MyCommand" .. spec.name, function()
    --             print("Executing command for: " .. spec.name .. " at " .. spec.path)
    --         end, { nargs = 0 })
    --     end
    -- end

    print(" ***** Salio al setup() *****")
end

return M

