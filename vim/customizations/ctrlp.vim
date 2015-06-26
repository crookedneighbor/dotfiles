" ========= CtrlP ========
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:15,results:15'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-p>','<c-k>', '<up>'],
  \ 'PrtHistory(-1)':       ['<c-j>'],
  \ 'PrtHistory(1)':        ['<c-k>'],
  \ }

noremap <silent> <leader>ff :CtrlP<CR>
noremap <silent> <leader>fr :CtrlPClearCache<CR>
noremap <silent> <leader>fb :CtrlPBuffer<CR>
