-- Wiki.vim configuration
-- Migrated from wiki.vim

vim.g.wiki_root = '~/nextcloud/wiki'
vim.g.wiki_filetypes = { 'md' }
vim.g.wiki_journal = {
  name = 'journal',
  frequency = 'daily',
  date_format = {
    daily = '%Y.%m.%d',
    weekly = '%Y_w%V',
    monthly = '%Y_m%m',
  },
  index_use_journal_scheme = true,
}

vim.g.wiki_map_link_create = 'UseHyphens'
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_write_on_nav = 1
vim.g.wiki_global_load = 0

-- Custom link creation function
function UseHyphens(text)
  return vim.fn.substitute(vim.fn.tolower(text), '\\s\\+', '-', 'g')
end

-- Make function available globally for wiki.vim
_G.UseHyphens = UseHyphens
