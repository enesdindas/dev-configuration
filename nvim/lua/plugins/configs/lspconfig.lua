require("plugins.configs.others").lsp_handlers()

local function on_attach(_, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    require("core.mappings").lspconfig()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {"markdown", "plaintext"}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local setup_lsp = function(attach)
    local lspconfig = require "lspconfig"
    -- lspservers with default config

    local servers = {
        "tsserver", "eslint", "gopls", "graphql", "pyright", "clangd", "jsonls", "sumneko_lua"
    }

    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 100}
        }
    end

    lspconfig.solargraph.setup {
        on_attach = attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 100},
        cmd = {"solargraph", "stdio"},
        init_options = {formatting = false},
        settings = {solargraph = {diagnostics = false}},
        root_dir = lspconfig.util.root_pattern('Gemfile', '.git', 'package.yml')
    }

    lspconfig.sorbet.setup {on_attach = attach, capabilities = capabilities, autostart = false}

    lspconfig.rls.setup {
        on_attach = attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 100},
        settings = {rust = {unstable_features = true, build_on_save = false, all_features = true}}
    }

    lspconfig.diagnosticls.setup {
        on_attach = attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 100},
        filetypes = {
            'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less',
            'scss', 'markdown', 'pandoc'
        },
        init_options = {
            linters = {
                eslint = {
                    command = 'eslint_d',
                    rootPatterns = {'.git'},
                    debounce = 100,
                    args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
                    sourceName = 'eslint_d',
                    parseJson = {
                        errorsRoot = '[0].messages',
                        line = 'line',
                        column = 'column',
                        endLine = 'endLine',
                        endColumn = 'endColumn',
                        message = '[eslint] ${message} [${ruleId}]',
                        security = 'severity'
                    },
                    securities = {[2] = 'error', [1] = 'warning'}
                }
            },
            filetypes = {
                javascript = 'eslint',
                javascriptreact = 'eslint',
                typescript = 'eslint',
                typescriptreact = 'eslint'
            },
            formatters = {
                eslint_d = {
                    command = 'eslint_d',
                    rootPatterns = {'.git'},
                    args = {'--stdin', '--stdin-filename', '%filename', '--fix-to-stdout'}
                },
                prettier = {
                    command = 'prettier_d',
                    rootPatterns = {'.git'},
                    args = {'--stdin', '--stdin-filepath', '%filename'}
                }
            },
            formatFiletypes = {
                css = 'prettier',
                javascript = 'prettier',
                javascriptreact = 'prettier',
                json = 'prettier',
                scss = 'prettier',
                less = 'prettier',
                typescript = 'prettier',
                typescriptreact = 'prettier',
                markdown = 'prettier'
            }
        }
    }
end

setup_lsp(on_attach)
