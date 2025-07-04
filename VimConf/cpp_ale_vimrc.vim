let g:ale_linters={
\   'c': ['clangd', 'cc'],
\   'cpp': ['clangd', 'cc'],
\}

let g:ale_cpp_cc_options='-std=c++17 -Wall'
let g:ale_c_cc_options='-std=c11 -Wall'
let g:ale_c_build_dir_names=['build']
" g:ale_c_build_dir='build' " to specify precisely
let g:ale_completion_enabled=1
set omnifunc=ale#completion#OmniFunc
let g:ale_c_parse_compile_commands=1
