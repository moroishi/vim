if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rcmdnk/vim-markdown'

call neobundle#end()

filetype indent on
NeoBundleCheck
