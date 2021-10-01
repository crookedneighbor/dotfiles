" ========= Ale ========
let g:ale_enabled = 1
let g:ale_set_signs = 1
" let g:ale_linters = {'javascript': ['typescript']}

let g:ale_linters = {
\   'javascript': ['typescript', 'eslint'],
\   'typescript': ['tsserver', 'tslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'markdown': ['prettier'],
\}

let g:ale_fix_on_save = 1
let ls_langs = 'typescript,javascript'
execute 'autocmd Filetype ' . ls_langs . ' imap <C-X><C-O> <Plug>(ale_complete)'
execute 'autocmd Filetype ' . ls_langs . ' nmap <C-]> <Plug>(ale_go_to_definition)'
execute 'autocmd Filetype ' . ls_langs . ' nmap <C-I> <Plug>(ale_hover)'
