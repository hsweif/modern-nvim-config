# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a comprehensive Neovim configuration repository supporting Linux, macOS, and Windows. It's built for Neovim 0.11.3+ and uses a modular Lua-based architecture with Lazy.nvim for plugin management.

## Architecture

### Entry Points
- `init.lua` - Main configuration entry point
- `ginit.vim` - GUI-specific configuration (Neovim GUI clients)
- `viml_conf/options.vim` - Core Vim options
- `viml_conf/plugins.vim` - Legacy Vim plugin configurations

### Core Structure
- `lua/` - Main Lua configuration modules
  - `plugin_specs.lua` - Plugin definitions and Lazy.nvim setup
  - `config/` - Individual plugin configurations
  - `mappings.lua` - All key mappings (leader key: `;`)
  - `globals.lua` - Global variables and settings
  - `colorschemes.lua` - Colorscheme management
  - `diagnostic-conf.lua` - LSP diagnostic configuration
  - `custom-autocmd.lua` - Custom autocommands
  - `utils.lua` - Utility functions
  - `lsp_utils.lua` - LSP-specific utilities

### Plugin Management
- Uses **Lazy.nvim** for plugin management with lazy loading
- Plugins are defined in `plugin_specs.lua` with conditional loading
- Configuration files are in `lua/config/` directory
- Mason.nvim is used for LSP server management

## Key Commands

### Plugin Management
```bash
:Lazy install    # Install plugins
:Lazy update     # Update plugins
:Lazy clean      # Clean unused plugins
:Mason           # Manage LSP servers
:MasonUpdate     # Update LSP servers
```

### Development Workflow
```bash
:checkhealth     # Check configuration health
:Edit <pattern>  # Edit files with glob pattern
:Redir <cmd>     # Capture command output
:CopyPath        # Copy current file path
```

### File Operations
- `<C-n>` - Toggle nvim-tree file explorer
- `<leader>ff` - Find files with telescope
- `<leader>yf` - Legacy file finder (telescope)
- `<leader>ys` - Live grep
- `<F10>` - Git files
- `<F11>` - Buffers

### LSP & Code
- `<leader>le` - Line diagnostics
- `<leader>lk` - Hover documentation
- `<leader>ld` - Go to definition
- `<leader>lr` - Rename symbol
- `<leader>la` - Code action
- `<leader>lf` - Format code

### Git Integration
- `<leader>hu` - Undo hunk
- `<leader>hn` - Next hunk
- `<leader>hc` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>gs` - Git status

### Terminal
- `<leader>tt` - Terminal in tab
- `<leader>tf` - Floating terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal

## Configuration Files

### Critical Files to Understand
1. `init.lua` - Bootstraps the entire configuration
2. `lua/plugin_specs.lua` - Plugin definitions and loading order
3. `lua/mappings.lua` - All key bindings (extensive legacy mappings added)
4. `lua/config/lsp.lua` - LSP configuration (recently migrated to Mason)
5. `lua/config/nvim-cmp.lua` - Autocompletion setup

### Plugin Configuration Pattern
Each plugin has its own file in `lua/config/`:
- `lsp.lua` - LSP servers and capabilities
- `nvim-tree.lua` - File explorer
- `fzf-lua.lua` - Fuzzy finding
- `lualine.lua` - Status line
- `treesitter.lua` - Syntax highlighting

## Colorschemes
- Uses `sainnhe/gruvbox-material` as default
- Random colorscheme loading on startup
- Multiple colorschemes available via `colorschemes.lua`

## Testing & Validation
- Use `:checkhealth` to validate configuration
- No formal test suite (this is a personal config)
- Configuration is validated on startup via version checking

## Platform Support
- **Linux/macOS/Windows** - Fully supported
- Platform-specific configurations handled automatically
- GUI support via `ginit.vim` for Neovim GUI clients