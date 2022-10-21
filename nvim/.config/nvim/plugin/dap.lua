local dap, dapui = require("dap"), require("dapui")
local vscodeJsAdapter = require("dap-vscode-js.adapter")
local vscodeJsConfig = require("dap-vscode-js.config")

require("dap-vscode-js").setup(
    {
        adapters = {"pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost"}
    }
)

for _, language in ipairs({"typescript", "javascript"}) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}"
        },
        {
            type = "pwa-node",
            request = "attach",
            restart = true,
            name = "Attach",
            protocol = "inspector",
            sourceMaps = true,
            console = "integratedTerminal",
            processId = require "dap.utils".pick_process,
            cwd = "${workspaceFolder}"
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach (remote)",
            protocol = "inspector",
            address = "localhost",
            port = "5858",
            console = "integratedTerminal",
            localRoot = "${workspaceRoot}",
            cwd = "${workspaceFolder}",
            sourceMaps = false,
            outDir = "null",
            remoteRoot = "null"
        }
    }
end

dapui.setup(
    {
        icons = {expanded = "▾", collapsed = "▸", current_frame = "▸"},
        mappings = {
            -- Use a table to apply multiple mappings
            expand = {"<CR>", "<2-LeftMouse>"},
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t"
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has("nvim-0.7"),
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    {id = "scopes", size = 0.25},
                    "breakpoints",
                    "stacks",
                },
                size = 40, -- 40 columns
                position = "left"
            },
            {
                elements = {
                    "console",
                },
                size = 0.25, -- 25% of total lines
                position = "bottom"
            }
        },
        controls = {
            -- Requires Neovim nightly (or 0.8 when released)
            enabled = true,
            -- Display controls in this element
            element = "repl",
            icons = {
                pause = "",
                play = "",
                step_into = "",
                step_over = "",
                step_out = "",
                step_back = "",
                run_last = "↻",
                terminate = "□"
            }
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = {"q", "<Esc>"}
            }
        },
        windows = {indent = 1},
        render = {
            max_type_length = nil, -- Can be integer or nil.
            max_value_lines = 100 -- Can be integer or nil.
        }
    }
)

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end --

vim.api.nvim_set_keymap("n", "<leader>D", "[DAP]", {})
vim.keymap.set("n", "[DAP]b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {})
vim.keymap.set("n", "[DAP]c", "<cmd>lua require'dap'.continue()<CR>", {})
vim.keymap.set("n", "[DAP]s", "<cmd>lua require'dap'.step_over()<CR>", {})
vim.keymap.set("n", "[DAP]S", "<cmd>lua require'dap'.step_into()<CR>", {})
vim.keymap.set("n", "[DAP]h", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", {})
