let g:ale_linters={'go' : ['gofmt', 'gopls']}

" Use ALE's function for asyncomplete defaults
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
    \ 'priority': 10,
    \ }))
