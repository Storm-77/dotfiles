
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "bash", "c", "lua", "vim", "vimdoc", "dockerfile" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,

    disable = {},
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd[[TSUpdate]]
