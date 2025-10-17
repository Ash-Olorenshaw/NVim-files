local function create_hover_msg()
	local params = vim.lsp.util.make_position_params(0, 'utf-8') -- may need to remove encoding, but that generates a warning
	vim.lsp.buf_request(0, 'textDocument/hover', params, function (hov_err, hover_result, ctx, _)
		if hov_err then return end
		vim.lsp.buf_request(0, 'textDocument/signatureHelp', params, function (sig_err, sig_result, ctx, _)
			if sig_err then return end

			local result = {}

			if sig_result and sig_result.signatures and sig_result.signatures[1] then
				local signature = sig_result.signatures[1]
				if signature.label then
					table.insert (result, signature.label)
				end
				if signature.documentation then
					table.insert (result, "")
					table.insert (result, vim.lsp.util.convert_input_to_markdown_lines(signature.documentation))
				end
			end
			if hover_result and hover_result.contents then
				table.insert (result, "")
				vim.list_extend(result, vim.lsp.util.convert_input_to_markdown_lines(hover_result.contents))
			end

			if vim.tbl_isempty(result) then return end
			vim.lsp.util.open_floating_preview(result, "markdown", { border = "rounded" })
		end)
	end)
end

local on_attach = function(client, bufnr) 
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', 'K', create_hover_msg, bufopts)
	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }})
	client.server_capabilities.semanticTokensProvider = nil
end

vim.lsp.config("powershell_es", {
	bundle_path = "/mnt/D-Files/lsp/PowerShellEditorServices",
	filetypes = { "ps1", "psm1", "psd1" },
    capabilities = vim.g.cmp_capabilities,
	on_attach = on_attach
})

vim.lsp.enable("powershell_es")
