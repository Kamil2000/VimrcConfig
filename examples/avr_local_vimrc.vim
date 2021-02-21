
set tags+=./tags/libavr_tags
set tags+=./tags/proj_tags

let g:ale_c_cc_executable='avr-gcc'
let g:ale_c_cc_options='-std=c11 -Wall -Os -DF_CPU=16000000 -mmcu=atmega328p'
let g:ale_linters={'c' : ['gcc']}
