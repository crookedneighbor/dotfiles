" ========= Ack ========
let g:AckAllFiles = 0
let g:AckCmd = 'ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'

noremap <LocalLeader>aw :Ack '<C-R><C-W>'
