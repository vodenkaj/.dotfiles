nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vrr :lua require('telescope.builtin').lsp_references{path_display = true}<CR>
