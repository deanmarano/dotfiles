let g:wiki_root = '~/nextcloud/wiki'
let g:wiki_filetypes = ['md']
let g:wiki_journal = {
      \ 'name': 'journal',
      \ 'frequency': 'daily',
      \ 'date_format': {
      \   'daily' : '%Y.%m.%d',
      \   'weekly' : '%Y_w%V',
      \   'monthly' : '%Y_m%m',
      \ },
      \ 'index_use_journal_scheme': v:true,
      \}

let g:wiki_map_link_create = 'MyFunction'
let g:wiki_link_target_type = 'md'
let g:wiki_write_on_nav = 1

function MyFunction(text) abort
  return substitute(tolower(a:text), '\s\+', '-', 'g')
endfunction
