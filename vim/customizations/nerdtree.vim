" ========= NERDTree ========
let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo']
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden=1

noremap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
noremap <silent> <LocalLeader>nr :NERDTree<CR>
noremap <silent> <LocalLeader>nf :NERDTreeFind<CR>
