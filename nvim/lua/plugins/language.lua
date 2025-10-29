-- Language-specific plugins
return {
  -- TypeScript
  {
    'leafgarland/typescript-vim',
    ft = { 'typescript', 'typescriptreact' },
  },

  -- Markdown
  {
    'tpope/vim-markdown',
    ft = 'markdown',
    config = function()
      vim.g.markdown_fenced_languages = { 'javascript', 'python', 'ruby', 'bash', 'sh' }
    end,
  },

  -- Fish shell
  {
    'dag/vim-fish',
    ft = 'fish',
  },

  -- Kitty terminal config
  {
    'fladson/vim-kitty',
    ft = 'kitty',
  },

  -- Brewfile
  {
    'bfontaine/Brewfile.vim',
    ft = 'brewfile',
  },

  -- Mustache/Handlebars
  {
    'mustache/vim-mustache-handlebars',
    ft = { 'mustache', 'handlebars' },
  },

  -- Ember tools
  {
    'AndrewRadev/ember_tools.vim',
    ft = { 'javascript', 'typescript' },
  },

  -- Ruby/Rails
  {
    'tpope/vim-rails',
    ft = 'ruby',
  },

  -- Spec finder (Ruby)
  {
    'skwp/vim-spec-finder',
    ft = 'ruby',
  },

  -- Projectionist (project configuration)
  {
    'tpope/vim-projectionist',
  },

  -- Wiki
  {
    'lervag/wiki.vim',
  },

  -- Dotoo (org-mode like)
  {
    'dhruvasagar/vim-dotoo',
    ft = 'dotoo',
  },

  -- Dotenv
  {
    'tpope/vim-dotenv',
  },
}
