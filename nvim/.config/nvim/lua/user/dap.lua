local dap = require("dap")
local dapui = require("dapui")

dap.adapters.java = function(callback, config)
  callback({
    type = 'server',
    host = config.host or 'localhost',
    port = config.port or 5005
  })
end

dap.configurations.java = {
  {
    type = 'java',
    request = 'attach',
    name = 'Debug (Attach) - Remote',
    hostName = 'localhost',
    port = "57032"
  }
}

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
