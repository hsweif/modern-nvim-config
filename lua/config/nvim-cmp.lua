-- Setup nvim-cmp.
local cmp = require("cmp")

require("cmp_nvim_lsp")
require("cmp_path")
require("cmp_buffer")
require("trae")

cmp.setup({
    snippet = {
        expand = function(args)
            -- No snippet engine configured
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-c>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = "trae",     group_index = 1 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "path",     group_index = 2 },
        { name = "buffer",   group_index = 2 },
    },
    experimental = {
        -- Enable ghost text similar to copilot
        ghost_text = true,
    },
})
