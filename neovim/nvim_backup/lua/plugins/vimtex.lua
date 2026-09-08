return {
  "lervag/vimtex",
  init = function()
    -- Use init for configuration, don't use the more common "config".
    -- leader key funciona y lo toma por defecto
    vim.g.vimtex_view_method = "zathura"
  end
}
