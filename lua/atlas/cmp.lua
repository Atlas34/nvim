local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
	},
}

function M.config()
	local cmp_status_ok, cmp = pcall(require, "cmp")
	if not cmp_status_ok then
		vim.notify("cmp Plugins not found!")
		return nil
	end

	local snip_status_ok, luasnip = pcall(require, "luasnip")
	if not snip_status_ok then
		vim.notify("luasnip Plugins not found!")
		return nil
	end

  -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
	require("luasnip/loaders/from_vscode").lazy_load()

	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end

	local icons = require("atlas.icons")

	local kind_icons = icons.kind

	cmp.setup({
    completion = {
      completeopt = "menu,menuone,preview,noselect",
    },
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end,
		},

		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			-- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				-- Kind icons
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

				if entry.source.name == "cmp_tabnine" then
					-- if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					-- menu = entry.completion_item.data.detail .. " " .. menu
					-- end
					vim_item.kind = icons.misc.Robot
				end
				-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- NOTE: order matters
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					nvim_lua = "[Nvim]",
					luasnip = "[Snippet]",
					buffer = "[Buffer]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		-- documentation = true,
		window = {
			-- documentation = "native",
			documentation = {
				border = 'rounded',
				winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
			},
			completion = {
				border = 'rounded',
				winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        col_offset = -3,
        side_padding = 1,
        scrollbar = false,
        scrolloff = 8,
			},
		},
		experimental = {
			ghost_text = true,
			--native_menu = false,
		},
	})
end

return M
