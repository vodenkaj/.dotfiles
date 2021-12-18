nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :Lspsaga signature_help<CR>
" Using telescope one instead
"nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :Lspsaga rename<CR>
nnoremap <leader>vh :Lspsaga hover_doc<CR>
nnoremap <leader>vca :Lspsaga code_action<CR>
nnoremap <leader>vsd :Lspsaga show_line_diagnostics<CR>
nnoremap <leader>vn :Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>vp :Lspsaga diagnostic_jump_prev<CR>

augroup LSP
    autocmd!
    autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
