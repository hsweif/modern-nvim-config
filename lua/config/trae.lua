local M = {}

M.setup = function()
  local ok, trae = pcall(require, "trae")
  if not ok then
    vim.notify("trae plugin not found", vim.log.levels.WARN)
    return
  end

  -- Configure trae with Tab priority
  trae.setup({
    -- Tab for trae suggestions
    accept_key = "<Tab>",
    dismiss_key = "<Esc>",
    next_suggestion = "<Tab>",
    prev_suggestion = "<S-Tab>",
  })

  -- Key mappings for trae functionality
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Toggle trae globally
  keymap("n", "<leader>ta", function()
    local trae_ok, trae_mod = pcall(require, "trae")
    if trae_ok then
      trae_mod.toggle()
    end
  end, { desc = "Toggle trae AI autocomplete" })
end

return M