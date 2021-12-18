lua require("jan")

nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <C-g> :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>vrr :lua require('telescope.builtin').lsp_references{path_display = true}<CR>

