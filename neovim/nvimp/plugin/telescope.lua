-- pcall stands for "protected call". It tests if the telescope module is available 
local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  return -- Stop reading this file if Telescope isn't installed
end


-- vim.pack.add({
-- Comentar este bloque para desactivar el enorme Telescope
-- local enable_telescope = false -- Change to true when you want it back

-- vim.pack.add({
--   "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
--   "https://github.com/nvim-tree/nvim-web-devicons",
--   "https://github.com/nvim-lua/plenary.nvim",
--   "https://github.com/nvim-telescope/telescope.nvim",
-- })

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  enabled = false, -- Add this line to disable it
  defaults = {

    -- Parce que c’est joli
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})

telescope.load_extension("fzf")

-- set keymaps
local keymap = vim.keymap -- for conciseness

keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { desc = "Recherche de chaînes de caractères dans les noms de fichiers" }
)
keymap.set(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { desc = "Recherche de chaînes de caractères dans le contenu des fichiers" }
)
keymap.set(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { desc = "Recherche de chaînes de caractères dans les noms de buffers" }
)
keymap.set(
  "n",
  "<leader>fx",
  "<cmd>Telescope grep_string<cr>",
  { desc = "Recherche de la chaîne de caractères sous le curseur" }
)
