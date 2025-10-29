-- Editing enhancement plugins
return {
  -- Commenting
  {
    'preservim/nerdcommenter',
  },

  -- Surround text objects
  {
    'tpope/vim-surround',
  },

  -- Repeat plugin commands with .
  {
    'tpope/vim-repeat',
  },

  -- Case conversion (camelCase, snake_case, etc)
  {
    'arthurxavierx/vim-caser',
  },

  -- Visual increment
  {
    'triglav/vim-visual-increment',
  },

  -- Auto-save
  {
    'vim-scripts/vim-auto-save',
  },

  -- Readline-style keybindings in insert/command mode
  {
    'tpope/vim-rsi',
  },

  -- Better readline for command mode
  {
    'vim-utils/vim-husk',
  },

  -- Emmet for HTML/CSS
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
  },

  -- EditorConfig support
  {
    'editorconfig/editorconfig-vim',
  },

  -- Auto-completion
  {
    'ervandew/supertab',
    branch = 'main',
  },

  -- Auto-end (add 'end' in Ruby, etc)
  {
    'tpope/vim-endwise',
  },

  -- Better matchit
  {
    'jwhitley/vim-matchit',
  },

  -- Sensible defaults
  {
    'tpope/vim-sensible',
  },

  -- Speed dating (increment dates)
  {
    'tpope/vim-speeddating',
  },

  -- Large file handling
  {
    'vim-scripts/LargeFile',
  },
}
