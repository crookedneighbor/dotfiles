" ========= Vimux ========
let g:VimuxUseNearestPane = 1
noremap <silent> <LocalLeader>vl :wa<CR> :VimuxRunLastCommand<CR>
noremap <silent> <LocalLeader>vi :wa<CR> :VimuxInspectRunner<CR>
noremap <silent> <LocalLeader>vk :wa<CR> :VimuxInterruptRunner<CR>
noremap <silent> <LocalLeader>vx :wa<CR> :VimuxClosePanes<CR>
noremap <silent> <LocalLeader>vp :VimuxPromptCommand<CR>
vnoremap <silent> <LocalLeader>vs "vy :call VimuxRunCommand(@v)<CR>
nnoremap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>

autocmd FileType javascript noremap <silent> <LocalLeader>rb :call VimuxRunCommand("clear; npm test " . bufname("%"))<CR>
autocmd FileType typescript noremap <silent> <LocalLeader>rb :call VimuxRunCommand("clear; npm test " . bufname("%"))<CR>
