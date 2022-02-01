local cmp = require('cmp')
local lspkind = require('lspkind')

local source_mapping = {
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	buffer = "[Buffer]",
	path = "[Path]",
}

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
   mapping = {
       ["<cr>"] = cmp.mapping.confirm({select = true}),
       ["<Tab>"] = cmp.mapping.select_next_item(),
       ["<S-Tab>"] = cmp.mapping.select_prev_item()
   },
   formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == 'cmp_tabnine' then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. ' ' .. menu
				end
				vim_item.kind = ''
			end
			vim_item.menu = menu
			return vim_item
		end
	},
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" },
        { name = "path" },
    },
})
