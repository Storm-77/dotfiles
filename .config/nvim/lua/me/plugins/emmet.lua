return
{
    'mattn/emmet-vim',
    ft = { 'php', 'html' },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- Enable Emmet for PHP files
        vim.g.user_emmet_settings = {
            php = {
                extends = 'html',
            },
        }
    end
};
