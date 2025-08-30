local dap = require("dap")

-- Use nvim-dap-go for better Go debugging
dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${workspaceFolder}",
  },
  {
    type = "go",
    name = "Debug Test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug Test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
  {
    type = "go",
    name = "Attach to Process",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
}