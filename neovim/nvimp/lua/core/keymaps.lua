-- On définit notre touche leader sur espace
vim.g.mapleader = " "

-- Raccourci pour la fonction set
local keymap = vim.keymap.set

-- on utilise ;; pour sortir du monde insertion
keymap("i", ";;", "<ESC>", { desc = "Sortir du mode insertion avec ;;" })

-- on efface le surlignage de la recherche
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Effacer le surlignage de la recherche" })

-- I déplace le texte sélectionné vers le haut en mode visuel (activé avec v)
keymap("v", "<S-i>", ":m .-2<CR>==", { desc = "Déplace le texte sélectionné vers le haut en mode visuel" })
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec v)
keymap("v", "<S-k>", ":m .+1<CR>==", { desc = "Déplace le texte sélectionné vers le bas en mode visuel" })

-- I déplace le texte sélectionné vers le haut en mode visuel bloc (activé avec V)
keymap(
	"x",
	"<S-i>",
	":move '<-2<CR>gv-gv",
	{ desc = "Déplace le texte sélectionné vers le haut en mode visuel bloc" }
)
-- K déplace le texte sélectionné vers le bas en mode visuel (activé avec V)
keymap(
	"x",
	"<S-k>",
	":move '>+1<CR>gv-gv",
	{ desc = "Déplace le texte sélectionné vers le bas en mode visuel bloc" }
)

-- Mapea :pdf para exportar el buffer actual a PDF
keymap("c", "pdf", "!pandoc % -o %.pdf<CR>", { desc = "Convert current file to PDF" })

-- Mapea :fe para ver la fecha de modificación de un archivo que estoy editando
keymap("c", "fe", "echo strftime('%c', getftime(expand('%')))<CR>", { desc = "Show file modification date" })
