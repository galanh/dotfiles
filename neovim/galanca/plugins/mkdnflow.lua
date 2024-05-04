-- markdown flow no especifica mas nada
return {
    "jakewvincent/mkdnflow.nvim",
    config = function()
        local mkdnflow = require('mkdnflow').setup({
    --       mappings = {
    --        MkdnEnter = {{'n', 'v'}, '<CR>'},
    --        MkdnCreateLink = true, 
    --        MkdnFollowLink = true, 
    --},
        })
    end,
}
