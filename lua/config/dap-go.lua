local dap_go = require("dap-go")

-- Setup nvim-dap-go for better Go debugging integration
dap_go.setup({
  dap_configurations = {
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
  },
  delve = {
    path = "dlv",
    initialize_timeout_sec = 20,
    port = "${port}",
    args = {},
    build_flags = "",
  },
})