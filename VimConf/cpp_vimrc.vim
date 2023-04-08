let g:ale_linters={'cpp' : ['clangd'], 'c' : ['clangd']}
let g:ale_completion_enabled=0
let g:ale_completion_delay=0
set completefunc=ale#completion#OmniFunc
let g:ale_completion_max_suggestions=50
imap <c-x><c-p> <Plug>(asyncomplete_force_refresh)
inoremap <c-x><c-l> :ALEHover<CR>
nnoremap <c-x><c-l> :ALEHover<CR>

" Use ALE's function for asyncomplete defaults
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
    \ 'priority': 10,
    \ }))
