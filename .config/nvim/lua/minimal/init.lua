
vim.cmd.colorscheme('sorbet') --torte
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

require('minimal.find')

vim.g.netrw_banner = 0 -- hide the top banner
vim.g.netrw_altfile = 1 -- keep the alternate file correct

vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

require('mini.jump2d').setup({
  mappings = {
    start_jumping = '<leader>s',
  },
})
