return {
    'mzarnitsa/psql',
    ft = { 'sql' },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require('psql').setup({
            database_name       = 'postgres',
            execute_selection   = '<leader>e',
            execute_paragraph   = '<leader>r',

            close_latest_result = '<leader>w',
            close_all_results   = '<leader>W',
        })
    end

};
