
vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
})
require("nvim-tree").setup({})

-- On utilise <leader>e pour ouvrir/fermer l’explorateur
vim.keymap.set(
  "n",
  "<leader>e",
  "<cmd>NvimTreeFindFileToggle<CR>",
  { desc = "Ouverture/fermeture de l’explorateur de fichiers" }
)
