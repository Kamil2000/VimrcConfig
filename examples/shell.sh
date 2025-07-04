#!/bin/bash

vim_go() {
    vim --cmd 'let g:local_vimrc_script="~/Documents/Projects/VimrcConfig/VimConf/go_ale_vimrc.vim"' "${@}"
}

vim_cpp() {
    vim --cmd 'let g:local_vimrc_script="~/Documents/Projects/VimrcConfig/VimConf/cpp_ale_vimrc.vim"' "${@}"
}
