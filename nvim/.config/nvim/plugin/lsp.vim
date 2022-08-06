nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
"nnoremap <leader>vsh :Lspsaga signature_help<CR>
" Using telescope one instead
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
"nnoremap <leader>vrn :Lspsaga rename<CR>
"nnoremap <leader>vh :Lspsaga hover_doc<CR>
"nnoremap <leader>vca :Lspsaga code_action<CR>
"nnoremap <leader>vsd :Lspsaga show_line_diagnostics<CR>
"nnoremap <leader>vn :Lspsaga diagnostic_jump_next<CR>
"nnoremap <leader>vp :Lspsaga diagnostic_jump_prev<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>vp :lua vim.diagnostic.goto_prev()<CR>
