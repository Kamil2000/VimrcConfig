#!/bin/bash

vim_go() {
    vim --cmd 'let g:local_vimrc_script="~/Documents/Projects/VimrcConfig/VimConf/go_ale_vimrc.vim"' "${@}"
}

vim_ale_cpp() {
    vim --cmd 'let g:local_vimrc_script="~/Documents/Projects/VimrcConfig/VimConf/cpp_ale_vimrc.vim"' "${@}"
}

vim_ycm_cpp() {
    vim --cmd 'let g:local_vimrc_script="~/Documents/Projects/VimrcConfig/VimConf/cpp_ycm_vimrc.vim"' "${@}"
}
