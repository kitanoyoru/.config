return function()
	-- Load nvim-lspconfig to get predefined server configurations
	require("lspconfig")

	-- Global LSP configuration
	vim.lsp.config('*', {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
		flags = {
			debounce_text_changes = 150,
		},
	})

	-- Enable specific language servers
	local servers = { 'gopls', 'rust_analyzer' }
	vim.lsp.enable(servers)

	-- Diagnostic keymaps
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end)
	vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

	-- LSP attach configuration
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			local opts = { buffer = ev.buf }
			vim.keymap.set("n", require("custom_keys").goto_declaration, vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", require("custom_keys").goto_definition, vim.lsp.buf.definition, opts)
			vim.keymap.set("n", require("custom_keys").goto_references, vim.lsp.buf.references, opts)
			vim.keymap.set("n", require("custom_keys").goto_impl, vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", require("custom_keys").lsp_rename, vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	})
end
