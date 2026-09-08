-- necesita definir leasderkey antes de lazy.lua
require("galanca.remap")
require("galanca.set")

require("galanca.lazy")

-- Recomendé activar la escritura automática para tipos de archivos markdown
vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})
