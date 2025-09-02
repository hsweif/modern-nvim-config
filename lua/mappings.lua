local keymap = vim.keymap
local uv = vim.uv

-- Set leader key to semicolon
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Save key strokes (now we do not need to press shift to enter command mode).
keymap.set({ "n", "x" }, ";", ":")

-- Turn the word under cursor to upper case
keymap.set("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
keymap.set("i", "<c-t>", "<Esc>b~lea")

-- Paste non-linewise text above or below current line, see https://stackoverflow.com/a/1346777/6064933
keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

-- Legacy key mappings to maintain old habits
keymap.set('n', '<C-n>', ':NvimTreeToggle<cr>', { desc = "Toggle file tree" })
-- File tree (nvim-tree)
keymap.set('n', '<leader>ff', ':NvimTreeFindFile<cr>', { desc = "Find current file in tree" })

-- Telescope with legacy y prefix
keymap.set('n', '<leader>yf', function() require('telescope.builtin').find_files {} end, { desc = "Find files" })
keymap.set('n', '<leader>ys', function() require('telescope.builtin').live_grep {} end, { desc = "Live grep" })
keymap.set('n', '<leader>yd',
    function() require('telescope.builtin').live_grep { search_dirs = { '.', '$GOPATH/pkg/mod/' } } end,
    { desc = "Grep Go modules" })
keymap.set('n', '<F10>', function() require('telescope.builtin').git_files {} end, { desc = "Git files" })
keymap.set('n', '<F11>', function() require('telescope.builtin').buffers {} end, { desc = "Buffers" })
keymap.set({ 'n', 'i' }, '<C-p>', function() require('telescope.builtin').registers {} end, { desc = "Registers" })

-- LSP with legacy l prefix
keymap.set('n', '<leader>le', function() vim.diagnostic.open_float() end, { desc = "Line diagnostics" })
keymap.set('n', '<leader>lE', function() vim.diagnostic.open_float({ scope = 'cursor' }) end,
    { desc = "Cursor diagnostics" })
keymap.set('n', '<leader>lq', vim.diagnostic.setqflist, { desc = "Quickfix diagnostics" })
keymap.set('n', '<leader>lk', vim.lsp.buf.hover, { desc = "Hover" })
keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = "Definition" })
keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename" })
keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, { desc = "Signature help" })
keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code action" })
keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = "Format" })
keymap.set('n', '<leader>lb', ':SymbolsOutline<cr>', { desc = "Symbols outline" })
keymap.set('n', '<leader>lu', vim.lsp.buf.references, { desc = "References" })
keymap.set('n', '<F12>', vim.lsp.buf.code_action, { desc = "Code action" })

-- Unit testing with neotest (Go)
keymap.set('n', '<leader>ur', function() require("neotest").run.run() end, { desc = "Run nearest test" })
keymap.set('n', '<leader>uf', function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run test file" })
keymap.set('n', '<leader>ud', function() require("neotest").run.run({ strategy = "dap" }) end,
    { desc = "Debug nearest test" })
keymap.set('n', '<leader>us', function() require("neotest").summary.toggle() end, { desc = "Toggle test summary" })
keymap.set('n', '<leader>uo', function() require("neotest").output.open({ enter = true }) end,
    { desc = "Show test output" })
keymap.set('n', '<leader>ua', function() require("neotest").run.run(vim.fn.getcwd()) end,
    { desc = "Run all tests in project" })
keymap.set('n', '<leader>ul', function() require("neotest").run.run_last() end, { desc = "Run last test" })
keymap.set('n', '<leader>ut', function() require("neotest").run.stop() end, { desc = "Stop test run" })

-- Debugging with nvim-dap
keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = "Start/continue debugging" })
keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = "Step into" })
keymap.set('n', '<leader>do', function() require("dap").step_over() end, { desc = "Step over" })
keymap.set('n', '<leader>dO', function() require("dap").step_out() end, { desc = "Step out" })
keymap.set('n', '<leader>dr', function() require("dap").repl.open() end, { desc = "Open REPL" })

-- Git with legacy h prefix
keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>', { desc = "Undo hunk" })
keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>', { desc = "Next hunk" })
keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>', { desc = "Preview hunk" })
keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>', { desc = "Reset hunk" })
keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer', { desc = "Reset buffer" })
keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>', { desc = "Blame line" })
keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>', { desc = "Diff this" })
keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })

-- Window management with legacy w prefix (resolved conflict: w1 -> wo)
keymap.set('n', '<leader>wo', '<c-w>o', { desc = "Only window" })
keymap.set('n', '<leader>wx', ':x<cr>', { desc = "Close window" })
keymap.set('n', '<leader>w2', ':sp<cr>', { desc = "Split horizontal" })
keymap.set('n', '<leader>w3', ':vs<cr>', { desc = "Split vertical" })

-- Window resize
keymap.set('n', '<m-9>', '<c-w><', { desc = "Decrease width" })
keymap.set('n', '<m-0>', '<c-w>>', { desc = "Increase width" })
keymap.set('n', '<m-->', '<c-w>-', { desc = "Decrease height" })
keymap.set('n', '<m-=>', '<c-w>+', { desc = "Increase height" })

-- Tab navigation
keymap.set('n', '<C-l>', ':tabprevious<cr>', { desc = "Previous tab" })
keymap.set('n', '<C-h>', ':tabnext<cr>', { desc = "Next tab" })

-- Terminal with legacy t prefix
keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>', { desc = "Terminal tab" })
keymap.set('n', '<leader>tn', function() require('toggleterm.terminal').Terminal:new():toggle() end,
    { desc = "New terminal" })
keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<cr>', { desc = "Terminal float" })
keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>', { desc = "Terminal horizontal" })
keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>', { desc = "Terminal vertical" })

-- Background toggle
local function set_bg_light()
    vim.cmd('set background=light')
    local colors_name = vim.g.colors_name
    vim.cmd('colorscheme shine')
    vim.cmd('colorscheme ' .. colors_name)
end

local function set_bg_dark()
    vim.cmd('set background=dark')
    local colors_name = vim.g.colors_name
    vim.cmd('colorscheme ron')
    vim.cmd('colorscheme ' .. colors_name)
end

keymap.set('n', '<leader>vl', set_bg_light, { desc = "Light background" })
keymap.set('n', '<leader>vd', set_bg_dark, { desc = "Dark background" })

-- Insert mode escape
keymap.set('i', 'jj', '<esc>', { desc = "Escape insert mode" })
keymap.set('i', '<C-;>', '::', { desc = "Insert :: for C++/Rust" })

-- Plugins
keymap.set('n', '<leader>pi', ':Lazy install<cr>', { desc = "Install plugins" })
keymap.set('n', '<leader>pc', ':Lazy clean<cr>', { desc = "Clean plugins" })
keymap.set('n', '<leader>pm', ':Mason<cr>', { desc = "Mason" })
keymap.set('n', '<leader>pM', ':MasonUpdate<cr>', { desc = "Mason update" })

-- Search
keymap.set('n', '<leader>sw', '/\\<lt>\\><left><left>', { desc = "Search word" })
keymap.set('n', '<leader>sf', function() require('hop').hint_words() end, { desc = "Hop to word" })

-- Debug
keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<cr>', { desc = "Toggle breakpoint" })
keymap.set('n', '<leader>dc', ':lua require"dap".continue()<cr>', { desc = "Continue debug" })

-- DAP-UI specific mappings
keymap.set('n', '<leader>du', function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
keymap.set('n', '<leader>de', function() require("dapui").eval() end, { desc = "Eval expression under cursor" })
keymap.set('v', '<leader>de', function() require("dapui").eval() end, { desc = "Eval visual selection" })
keymap.set('n', '<leader>df', function() require("dapui").float_element("scopes", { enter = true }) end,
    { desc = "Float scopes" })
keymap.set('n', '<leader>dB', function() require("dapui").float_element("breakpoints", { enter = true }) end,
    { desc = "Float breakpoints" })
keymap.set('n', '<leader>dw', function() require("dapui").float_element("watches", { enter = true }) end,
    { desc = "Float watches" })
keymap.set('n', '<leader>ds', function() require("dapui").float_element("stacks", { enter = true }) end,
    { desc = "Float stacks" })
keymap.set('n', '<leader>dr', function() require("dapui").float_element("repl", { enter = true }) end,
    { desc = "Float repl" })
keymap.set('n', '<leader>dC', function() require("dapui").float_element("console", { enter = true }) end,
    { desc = "Float console" })

-- Bookmarks
keymap.set('n', '<leader>mk', ':BookmarkToggle<cr>', { desc = "Toggle bookmark" })
keymap.set('n', '<leader>ma', ':BookmarkShowAll<cr>', { desc = "Show bookmarks" })


-- Saves the file if modified and quit
keymap.set("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })

-- Quit all opened buffers
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

-- Close location list or quickfix list if they are present, see https://superuser.com/q/355325/736190
keymap.set("n", [[\x]], "<cmd>windo lclose <bar> cclose <cr>", {
    silent = true,
    desc = "close qf and location list",
})

-- Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933
keymap.set("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", {
    silent = true,
    desc = "delete current buffer",
})

keymap.set("n", [[\D]], function()
    local buf_ids = vim.api.nvim_list_bufs()
    local cur_buf = vim.api.nvim_win_get_buf(0)

    for _, buf_id in pairs(buf_ids) do
        -- do not Delete unlisted buffers, which may lead to unexpected errors
        if vim.api.nvim_get_option_value("buflisted", { buf = buf_id }) and buf_id ~= cur_buf then
            vim.api.nvim_buf_delete(buf_id, { force = true })
        end
    end
end, {
    desc = "delete other buffers",
})

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136133/6064933
keymap.set("n", "<space>o", "printf('m`%so<ESC>``', v:count1)", {
    expr = true,
    desc = "insert line below",
})

keymap.set("n", "<space>O", "printf('m`%sO<ESC>``', v:count1)", {
    expr = true,
    desc = "insert line above",
})

-- Move the cursor based on physical lines, not the actual lines.
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "^", "g^")
keymap.set("n", "0", "g0")

-- Do not include white space characters when using $ in visual mode,
-- see https://vi.stackexchange.com/q/12607/15292
keymap.set("x", "$", "g_")

-- Go to start or end of line easier
keymap.set({ "n", "x" }, "H", "^")
keymap.set({ "n", "x" }, "L", "g_")

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
keymap.set("x", "<", "<gv")
keymap.set("x", ">", ">gv")

-- Edit and reload nvim config file quickly
keymap.set("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
    silent = true,
    desc = "open init.lua",
})

keymap.set("n", "<leader>sv", function()
    vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
    vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
    silent = true,
    desc = "reload init.lua",
})

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
keymap.set("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {
    expr = true,
    desc = "reselect last pasted area",
})

-- Always use very magic mode for searching
-- keymap.set("n", "/", [[/\v]])

-- Search in selected region
-- xnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>

-- Change current working directory locally and print cwd after that,
-- see https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
keymap.set("n", "<leader>cd", "<cmd>lcd %:p:h<cr><cmd>pwd<cr>", { desc = "change cwd" })

-- Use Esc to quit builtin terminal
keymap.set("t", "<Esc>", [[<c-\><c-n>]])

-- Toggle spell checking
keymap.set("n", "<F11>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
keymap.set("i", "<F11>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "cc", '"_cc')
keymap.set("x", "c", '"_c')

-- Remove trailing whitespace characters
keymap.set("n", "<leader><space>", "<cmd>StripTrailingWhitespace<cr>", { desc = "remove trailing space" })

-- Copy entire buffer.
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })

-- Toggle cursor column
keymap.set("n", "<leader>cl", "<cmd>call utils#ToggleCursorCol()<cr>", { desc = "toggle cursor column" })

-- Move current line up and down
keymap.set("n", "<A-k>", '<cmd>call utils#SwitchLine(line("."), "up")<cr>', { desc = "move line up" })
keymap.set("n", "<A-j>", '<cmd>call utils#SwitchLine(line("."), "down")<cr>', { desc = "move line down" })

-- Move current visual-line selection up and down
keymap.set("x", "<A-k>", '<cmd>call utils#MoveSelection("up")<cr>', { desc = "move selection up" })

keymap.set("x", "<A-j>", '<cmd>call utils#MoveSelection("down")<cr>', { desc = "move selection down" })

-- Replace visual selection with text in register, but not contaminate the register,
-- see also https://stackoverflow.com/q/10723700/6064933.
keymap.set("x", "p", '"_c<Esc>p')

-- Go to a certain buffer
keymap.set("n", "gb", '<cmd>call buf_utils#GoToBuffer(v:count, "forward")<cr>', {
    desc = "go to buffer (forward)",
})
keymap.set("n", "gB", '<cmd>call buf_utils#GoToBuffer(v:count, "backward")<cr>', {
    desc = "go to buffer (backward)",
})

-- Switch windows
keymap.set("n", "<left>", "<c-w>h")
keymap.set("n", "<Right>", "<C-W>l")
keymap.set("n", "<Up>", "<C-W>k")
keymap.set("n", "<Down>", "<C-W>j")

-- Text objects for URL
keymap.set({ "x", "o" }, "iu", "<cmd>call text_obj#URL()<cr>", { desc = "URL text object" })

-- Text objects for entire buffer
keymap.set({ "x", "o" }, "iB", ":<C-U>call text_obj#Buffer()<cr>", { desc = "buffer text object" })

-- Do not move my cursor when joining lines.
keymap.set("n", "J", function()
    vim.cmd([[
      normal! mzJ`z
      delmarks z
    ]])
end, {
    desc = "join lines without moving cursor",
})

keymap.set("n", "gJ", function()
    -- we must use `normal!`, otherwise it will trigger recursive mapping
    vim.cmd([[
      normal! mzgJ`z
      delmarks z
    ]])
end, {
    desc = "join lines without moving cursor",
})

-- Break inserted text into smaller undo units when we insert some punctuation chars.
local undo_ch = { ",", ".", "!", "?", ";", ":" }
for _, ch in ipairs(undo_ch) do
    keymap.set("i", ch, ch .. "<c-g>u")
end

-- insert semicolon in the end
keymap.set("i", "<A-;>", "<Esc>miA;<Esc>`ii")

-- Go to the beginning and end of current line in insert mode quickly
keymap.set("i", "<C-A>", "<HOME>")
keymap.set("i", "<C-E>", "<END>")

-- Go to beginning of command in command-line mode
keymap.set("c", "<C-A>", "<HOME>")

-- Delete the character to the right of the cursor
keymap.set("i", "<C-D>", "<DEL>")

keymap.set("n", "<leader>cb", function()
    local cnt = 0
    local blink_times = 7
    local timer = uv.new_timer()
    if timer == nil then
        return
    end

    timer:start(
        0,
        100,
        vim.schedule_wrap(function()
            vim.cmd([[
      set cursorcolumn!
      set cursorline!
    ]])

            if cnt == blink_times then
                timer:close()
            end

            cnt = cnt + 1
        end)
    )
end, { desc = "show cursor" })

keymap.set("n", "q", function()
    vim.print("q is remapped to Q in Normal mode!")
end)
keymap.set("n", "Q", "q", {
    desc = "Record macro",
})

keymap.set("n", "<Esc>", function()
    vim.cmd("fclose!")
end, {
    desc = "close floating win",
})
