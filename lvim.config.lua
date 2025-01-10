vim.opt.relativenumber = true -- Relative line numbers
vim.opt.shiftwidth = 4        -- Number of spaces per identation
vim.opt.tabstop = 4           -- Number of visual spaces per TAB
vim.opt.wrap = true           -- Wrap lines

lvim.autocommands = {
    { -- Return to last edit position when opening files
        "BufReadPost",
        {
            pattern = { "*" },
            command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
        }
    },
}

lvim.builtin.gitsigns.opts.current_line_blame = true
lvim.builtin.gitsigns.opts.current_line_blame_formatter = "    <author>, <author_time:%Y-%m-%d> - <summary>"
lvim.builtin.gitsigns.opts.current_line_blame_opts.delay = 100

lvim.builtin.nvimtree.setup.hijack_directories.enable = true

lvim.format_on_save.enabled = true

lvim.keys.normal_mode["y"] = '"+yy'

lvim.plugins = {
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
                require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
            end, 100)
        end,
    }
}
