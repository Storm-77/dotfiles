
require("mason").setup();

require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "tsserver", "clangd", "volar"}
});

local on_attach = function ()
   vim.keymap.set("n","<leader>rn", "vim.lsp.buf.rename",{}) 
   vim.keymap.set("n","<leader>ca", "vim.lsp.buf.code_action",{}) 


   vim.keymap.set("n","gd", vim.lsp.buf.definition,{})
   vim.keymap.set("n","gi", vim.lsp.buf.implementation,{})
   vim.keymap.set("n","gf", require("telescope.builtin").lsp_references,{})
   vim.keymap.set("n","K", vim.lsp.buf.definition,{})
end

require("lspconfig").clangd.setup{
    on_attach = on_attach
}
require("lspconfig").tsserver.setup{
    on_attach = on_attach
}
require("lspconfig").volar.setup{
    on_attach = on_attach
}
require("lspconfig").lua_ls.setup{
    on_attach = on_attach
}
require("lspconfig").denols.setup{
    on_attach = on_attach
}
require("lspconfig").astro.setup{
    on_attach = on_attach
}
require("lspconfig").ast_grep.setup{
    on_attach = on_attach
}
require("lspconfig").gopls.setup{
    on_attach = on_attach
}
