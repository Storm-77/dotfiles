return {
  'nvim-mini/mini.nvim',
  version = '*',
  config = function()
    require('mini.jump2d').setup({
      mappings = {
        start_jumping = '<leader>s',
        view = {
        -- Whether to dim lines with at least one jump spot
         dim = false,
        -- How many steps ahead to show. Set to big number to show all steps.
         n_steps_ahead = 2
        },
      },
    })
  end
}


