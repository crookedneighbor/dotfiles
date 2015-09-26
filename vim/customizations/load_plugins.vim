call plug#begin('~/.vim/plugged')

" ========= Plugins ========
Plug 'benmills/vim-commadown'
Plug 'benmills/vimux'
Plug 'CamelCaseMotion'
Plug 'crookedneighbor/bufexplorer'
Plug 'crookedneighbor/wap-it', { 'branch': 'leader-mapping' }
Plug 'digitaltoad/vim-jade'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'henrik/vim-indexed-search'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'pgr0ss/vimux-ruby-test'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on
