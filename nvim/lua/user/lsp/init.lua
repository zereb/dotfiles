local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local cmp_nvim_lsp = require("cmp_nvim_lsp")



lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-<CR>>", "<cmd>FzfLua lsp_code_actions <CR>", opts)
        end,
        capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }

    if server.name == "sumneko_lua" then
	    local sumneko_opts = require("user.lsp.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

    if server.name == "jdtls" then
        local jdtls_opts = require("user.lsp.jdtls")
        opts = vim.tbl_deep_extend("force", jdtls_opts, opts)
    end


        -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    server:setup(opts)
end)

