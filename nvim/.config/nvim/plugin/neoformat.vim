let g:neoformat_cpp_clangformatter = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=Google'],
            \ }


let g:neoformat_enabled_cpp = ['clangformatter']
let g:neoformat_run_all_formatters = 1
