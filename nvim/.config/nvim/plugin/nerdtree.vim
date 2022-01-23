nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

function IgnoreFiles()
    let g:NERDTreeIgnore = ['\.csproj', 'Logs', 'Models',
                            \'Scenes', 'obj', 'Library', 'Packages',
                            \'ProjectSettings', 'Temp', 'UserSettings',
                            \'\.sln', '\.meta']
endfunction

command! IgnoreFiles call IgnoreFiles()
