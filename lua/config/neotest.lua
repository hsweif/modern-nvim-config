local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-golang")({
      -- Configure Go test runner
      go_test_args = { "-v", "-race", "-count=1" },
      dap_go_enabled = true, -- Enable debugging
      go_mod_test_args = { "-v", "-race", "-count=1" },
      go_test_executable = "go",
    }),
  },
  -- Key mappings
  status = {
    virtual_text = true,
    signs = true,
  },
  output = {
    enabled = true,
    open_on_run = true,
  },
  quickfix = {
    enabled = true,
    open = false,
  },
})