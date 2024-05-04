-- vimwiki encuentra index.wiki y NO index.md
return {
    "vimwiki/vimwiki",
    branch = "dev",
    --event = {"BufEnter"},
    keys  = {"<leader>ww"},

    config = function()
        vim.g.vimwiki_list = {
            {
            path = "~/vimwiki/",
            ext = "md",
            syntax = "markdown"
        },
        }
        -- setting the options before Lazy ?
        vim.g.vimwiki_global_ext = true
    end
}
