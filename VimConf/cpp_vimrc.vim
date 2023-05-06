let g:ale_linters={'cpp' : ['clangd'], 'c' : ['clangd']}
let g:ale_completion_enabled=0
let g:ale_completion_delay=0
set completefunc=ale#completion#OmniFunc
let g:ale_completion_max_suggestions=50
imap <c-x><c-p> <Plug>(asyncomplete_force_refresh)
nnoremap <c-x><c-p> :ALEHover<CR>

augroup HoverAfterComplete                                                        
    autocmd!                                                                    
    " display argument list of the selected completion candidate using ALEHover
    autocmd User ALECompletePost ALEHover                                       
augroup END

" Use ALE's function for asyncomplete defaults
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
    \ 'priority': 10,
    \ }))
