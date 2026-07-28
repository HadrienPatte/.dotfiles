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
    { -- Detect Helm template files and set appropriate filetype
        { "BufRead", "BufNewFile" },
        {
            pattern = { "*/templates/*.yaml", "*/templates/*.yml" },
            command = "set filetype=helm",
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

                -- copilot-cmp calls the deprecated dot-form `client.is_stopped()`, which warns on every keystroke in insert mode.
                -- Override with the colon form, all sources share this table via __index.
                require("copilot_cmp.source").is_available = function(self)
                    if self.client:is_stopped() or self.client.name ~= "copilot" then
                        return false
                    end
                    return next(vim.lsp.get_clients({
                        bufnr = vim.api.nvim_get_current_buf(),
                        id = self.client.id,
                    })) ~= nil
                end
            end, 100)
        end,
    }
}
