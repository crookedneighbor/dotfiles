let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ========= Plugins ========
Plug 'benmills/vim-commadown'
Plug 'benmills/vimux'
Plug 'crookedneighbor/bufexplorer'
Plug 'crookedneighbor/wap-it', { 'branch': 'leader-mapping' }
Plug 'digitaltoad/vim-jade'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'henrik/vim-indexed-search'
Plug 'joshdick/onedark.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier'
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
Plug 'vim-scripts/CamelCaseMotion'
Plug 'w0rp/ale'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on

" Colors
colorscheme onedark

if (has("termguicolors"))
  set termguicolors
endif
