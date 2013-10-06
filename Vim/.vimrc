syntax on
filetype indent plugin on

set ruler
set showcmd
set number
set cursorline
set ruler

set ignorecase smartcase
set incsearch
set hlsearch

set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

nnoremap <C-N> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <C-B> :call CompileStart()<CR>
func! CompileStart()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -Wall -O2 -o %< `pkg-config --libs --cflags gtk+-3.0`"
        exec "!./%<"
    elseif &filetype == 'cpp'
    exec "!g++ % -Wall -O2 -o %< `pkg-config --libs --cflags gtk+-3.0`"
    exec "!./%<"
    elseif &filetype == 'python'
    exec "!python %"
    elseif &filetype == 'makefile'
    exec "!make -j8"
    exec "!make run"
    endif
endfunc

