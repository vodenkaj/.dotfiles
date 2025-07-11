_G.selected_process_id = nil

-- Function to open a Telescope picker and select a process
local function select_process_with_telescope(dap, filter)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values

  -- Get the list of node processes
  local processes = require("dap.utils").get_processes({ filter = filter })

  _G.selected_process_id = nil
  pickers
    .new({}, {
      prompt_title = "Select" .. " " .. filter .. " " .. "Process",
      finder = finders.new_table({
        results = processes,
        entry_maker = function(entry)
          return {
            value = entry.pid,
            display = entry.name,
            ordinal = entry.name,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<C-c>", function()
          actions.close(prompt_bufnr)
          if _G.selected_process_id == nil then
            dap.disconnect()
            dap.close()
          end
        end)
        map("i", "<Esc>", function()
          actions.close(prompt_bufnr)
          if _G.selected_process_id == nil then
            dap.disconnect()
            dap.close()
          end
        end)

        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          _G.selected_process_id = selection.value
        end)

        return true
      end,
    })
    :find()
end

return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = true,
  },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    init = function()
      --require("dap-vscode-js").setup({
      --  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      --  debugger_path = "/home/janv/Downloads/vscode-js-debug/out/src/vsDebugServer.js",                              -- Path to vscode-js-debug installation.
      --  debugger_cmd = { "" },                                                          -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      --  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      --  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
      --  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      --  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      --})
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    init = function()
      vim.api.nvim_set_keymap("n", "<leader>D", "[DAP]", {})
      vim.keymap.set("n", "[DAP]b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {})
      vim.keymap.set("n", "[DAP]c", "<cmd>lua require'dap'.continue()<CR>", {})
      vim.keymap.set("n", "[DAP]s", "<cmd>lua require'dap'.step_over()<CR>", {})
      vim.keymap.set("n", "[DAP]S", "<cmd>lua require'dap'.step_into()<CR>", {})
      vim.keymap.set("n", "[DAP]t", ":DapToggleRepl<CR>", {})

      require("mason-nvim-dap").setup({
        ensure_installed = {},
        automatic_installation = true,
        handlers = {},
      })

      -- For complied languages to work,
      -- you have to set /proc/sys/kernel/yama/ptrace_scope value to 0.
      -- Otherwise this feature blocks one process from examining and modifying another process
      -- unless the second process (child) was started by the first process (parent).
      local dap = require("dap")

      --dap.adapters.chrome = {
      --  -- executable: launch the remote debug adapter - server: connect to an already running debug adapter
      --  type = "executable",
      --  -- command to launch the debug adapter - used only on executable type
      --  command = "node",
      --  args = { os.getenv("HOME") .. "/.local/share/nvim/lsp-debuggers/vscode-chrome-debug/out/src/chromeDebug.js" },
      --}

      dap.adapters.gdb = {
        type = "executable",
        command = "rust-gdb", -- adjust as needed
        args = { "-i", "dap" },
        name = "gdb",
      }
      dap.configurations.rust = {
        {
          name = "rust-gdb",
          type = "gdb",
          request = "attach",
          stopOnEntry = false,
          pid = function()
            select_process_with_telescope(dap, "rust")
            return _G.selected_process_id
          end,
        },
      }

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "8123",
        --executable = {
        --  command = "node",
        --  args = { "/home/janv/Documents/vscode-js-debug/js-debug/src/dapDebugServer.js" },
        --},
        name = "pwa-node",
      }
      dap.configurations.typescript = {
        {
          name = "node",
          type = "pwa-node",
          request = "attach",
          pid = function()
            return 57552
          end,
        },
        {
          -- use nvim-dap-vscode-js's pwa-chrome debug adapter
          type = "pwa-chrome",
          request = "launch",
          -- name of the debug action
          name = "Launch Chrome to debug client side code",
          -- default vite dev server url
          url = "http://localhost:5173",
          -- for TypeScript/Svelte
          sourceMaps = true,
          webRoot = "${workspaceFolder}/src",
          protocol = "inspector",
          port = 9222,
          -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
      }
    end,
  },
  {
    {
      "igorlfs/nvim-dap-view",
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {},
    },
  },
}
