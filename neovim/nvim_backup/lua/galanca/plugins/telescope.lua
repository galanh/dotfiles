return {
  "nvim-telescope/telescope.nvim",
  event = 'VimEnter',
  branch = "0.1.x",
  dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        "nvim-tree/nvim-web-devicons",
        },
  config = function()
     require('telescope').setup {
        extensions = {
            ['ui-select'] = {
                i = { ['<c-enter>'] = 'to_fuzzy_refine' },
            },
        }
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require 'telescope.builtin'

    -- Popular keymaps
    keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })                         
    keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })                        
    keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })                       
    keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })               
    keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })               
    keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })                      
    keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })                
    keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })                          

    -- Tiempo: Recientes archivos y buffers presentes
    keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme                                   
    vim.keymap.set('n', '<leader>/', function()                                                             
    -- You can pass additional configuration to telescope to change theme, layout, etc.                   
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {                          
      winblend = 10,                                                                                      
      previewer = false,                                                                                  
    })                                                                                                    
    end, { desc = '[/] Fuzzily search in current buffer' })                                                 
                                                                                                          
    -- Also possible to pass additional configuration options.                                              
    --  See :help telescope.builtin.live_grep() for information about particular keys                       
    vim.keymap.set('n', '<leader>s/', function()                                                            
    builtin.live_grep {                                                                                   
      grep_open_files = true,                                                                             
      prompt_title = 'Live Grep in Open Files',                                                           
    }                                                                                                     
    end, { desc = '[S]earch [/] in Open Files' })                                                           
                                                                                                          
    -- Shortcut for searching your neovim configuration files                                               
    vim.keymap.set('n', '<leader>sn', function()                                                            
    builtin.find_files { cwd = vim.fn.stdpath 'config' }                                                  
    end, { desc = '[S]earch [N]eovim files' })                                                              
    end,                                                                                                      

}

