nnoremap <leader>n :NvimTreeFocus<CR>
nnoremap <C-n> :NvimTreeOpen<CR>
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

function IgnoreFiles()
    let g:NERDTreeIgnore = ['\.csproj', 'Logs', 'Models',
                            \'Scenes', 'obj', 'Library', 'Packages',
                            \'ProjectSettings', 'Temp', 'UserSettings',
                            \'\.sln', '\.meta']
endfunction

command! IgnoreFiles call IgnoreFiles()
