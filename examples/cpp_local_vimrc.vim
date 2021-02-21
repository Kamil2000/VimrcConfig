let g:ale_linters={'cpp' : ['clangd']}
let g:ale_completion_enabled=0
let g:ale_completion_delay=0
set completefunc=ale#completion#OmniFunc
let g:ale_cpp_clangd_options='--compile-commands-dir=/home/kamilos/Projects/AlgGen/build'
