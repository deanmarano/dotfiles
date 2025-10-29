-- UI and visual enhancement plugins
return {
  -- Modern file explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- File icons (replaces vim-devicons)
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true, -- Close Neo-tree if it's the last window
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = {
            padding = 0,
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '󰜌',
            default = '',
          },
          git_status = {
            symbols = {
              added     = '✚',
              modified  = '',
              deleted   = '✖',
              renamed   = '',
              untracked = '',
              ignored   = '',
              unstaged  = '',
              staged    = '',
              conflict  = '',
            },
          },
        },
        window = {
          position = 'left',
          width = 37, -- Same as your NERDTree width
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            -- NERDTree-compatible mappings
            ['<space>'] = 'toggle_node',
            ['<cr>'] = 'open',
            ['<esc>'] = 'revert_preview',
            ['P'] = { 'toggle_preview', config = { use_float = true } },
            ['l'] = 'focus_preview',
            ['s'] = 'open_split',
            ['v'] = 'open_vsplit',
            ['t'] = 'open_tabnew',
            ['C'] = 'close_node',
            ['z'] = 'close_all_nodes',
            ['Z'] = 'expand_all_nodes',
            ['a'] = {
              'add',
              config = {
                show_path = 'relative', -- "none", "relative", "absolute"
              },
            },
            ['A'] = 'add_directory',
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['y'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['c'] = 'copy', -- takes text input for destination
            ['m'] = 'move', -- takes text input for destination
            ['q'] = 'close_window',
            ['R'] = 'refresh',
            ['?'] = 'show_help',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
            ['i'] = 'show_file_details',
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              '.DS_Store',
              'thumbs.db',
            },
            hide_by_pattern = {
              '*.pyc',
              '*.js.map',
            },
            never_show = {
              '.git',
            },
          },
          follow_current_file = {
            enabled = true, -- Find current file in tree
          },
          use_libuv_file_watcher = true, -- Auto-refresh on file changes
        },
      })
    end,
  },

  -- Git gutter (show git changes in sign column)
  {
    'airblade/vim-gitgutter',
    branch = 'main',
  },

  -- Distraction-free writing
  {
    'junegunn/goyo.vim',
    cmd = 'Goyo',
    config = function()
      -- Goyo enter function
      vim.api.nvim_create_autocmd('User', {
        pattern = 'GoyoEnter',
        callback = function()
          vim.opt.wrap = true
          vim.opt.linebreak = true
          vim.fn.system('tmux set status off')
          vim.fn.system("tmux list-panes -F '\\#F' | grep -q Z || tmux resize-pane -Z")
          vim.opt.showmode = false
          vim.opt.showcmd = false
          vim.opt.scrolloff = 999
          vim.opt.spell = true
          vim.opt.spelllang = 'en_us'
        end,
      })

      -- Goyo leave function
      vim.api.nvim_create_autocmd('User', {
        pattern = 'GoyoLeave',
        callback = function()
          vim.fn.system('tmux set status on')
          vim.fn.system("tmux list-panes -F '\\#F' | grep -q Z && tmux resize-pane -Z")
          vim.opt.wrap = false
          vim.opt.linebreak = false
          vim.opt.showmode = true
          vim.opt.showcmd = true
          vim.opt.scrolloff = 5
          vim.opt.spell = false
        end,
      })
    end,
  },

  -- CSS color preview
  {
    'ap/vim-css-color',
  },

  -- Zoom splits
  {
    'dhruvasagar/vim-zoom',
    keys = {
      { '<C-W>z', '<Plug>(zoom-toggle)<C-l>', desc = 'Toggle zoom' },
    },
  },

  -- Color table
  {
    'guns/xterm-color-table.vim',
    cmd = 'XtermColorTable',
  },

  -- Multi-cursor support
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    config = function()
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_maps = {
        ['Undo'] = 'u',
        ['Redo'] = '<C-r>',
      }
    end,
  },

  -- Toggle cursor shape in different modes
  {
    'jszakmeister/vim-togglecursor',
  },
}
