let g:ale_linters={
\   'c': ['clangd', 'cc'],
\   'cpp': ['clangd', 'cc'],
\}

let g:ale_cpp_cc_options='-std=c++17 -Wall'
let g:ale_c_cc_options='-std=c11 -Wall'
let g:ale_c_build_dir_names=['build']
" g:ale_c_build_dir='build' " to specify precisely
let g:ale_completion_enabled=0
set updatetime=1000
let g:ale_c_parse_compile_commands=1
let g:asyncomplete_enable_for_all = 1 

" Use ALE's function for asyncomplete defaults
" Provide your own overrides here.
au User asyncomplete_setup call asyncomplete#register_source(
\   asyncomplete#sources#ale#get_source_options({
\       'priority': 10,
\   })
\)
