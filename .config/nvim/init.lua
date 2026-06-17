-- ============================================================================
-- Neovim config (super-minimal, hand-rolled)
--
-- Purpose: fast startup, fuzzy file search, and nice Markdown viewing.
-- Coding is mostly done by AI (Claude Code / Codex) inside cmux; this editor
-- is for confirming code and the occasional light edit.
--
-- Stack: lazy.nvim + fzf-lua + Treesitter + render-markdown.nvim + live-preview.nvim
-- LSP is intentionally NOT enabled by default. See the commented block at the
-- bottom for how to add it per-language later.
-- ============================================================================

-- Leader must be set before lazy.nvim loads so plugin key mappings register.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ----------------------------------------------------------------------------
-- Options (mirrors ~/.vimrc, plus sensible Neovim defaults)
-- ----------------------------------------------------------------------------
local opt = vim.opt

opt.number = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.termguicolors = true   -- true color (needed by render-markdown / colorscheme)
opt.ignorecase = true
opt.smartcase = true       -- case-sensitive only when the search has uppercase
opt.mouse = 'a'
opt.clipboard = 'unnamedplus' -- use the macOS system clipboard
opt.signcolumn = 'yes'
opt.scrolloff = 5
opt.undofile = true        -- persistent undo
opt.splitright = true
opt.splitbelow = true

-- Shared key mappings (leader=space, jj=esc, buffer/tab nav, etc.).
-- Single source of truth, also used by ~/.vimrc and IdeaVim conventions.
local keymaps = vim.fn.expand('~/.keymaps.vim')
if vim.fn.filereadable(keymaps) == 1 then
  vim.cmd('source ' .. keymaps)
end

-- ----------------------------------------------------------------------------
-- Bootstrap lazy.nvim (clones itself on first launch; plugins auto-install)
-- ----------------------------------------------------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Failed to clone lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------------------
-- Plugins
-- ----------------------------------------------------------------------------
require('lazy').setup({
  -- Colorscheme: improves readability when confirming code.
  -- Remove this spec if you prefer the built-in default.
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },

  -- Fuzzy finder: lazy file/content search. Uses the `fzf` binary already
  -- installed via bootstrap/fzf.sh; `rg` (ripgrep) powers grep/find.
  {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    keys = {
      { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
      { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (live)' },
      { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>FzfLua help_tags<cr>', desc = 'Help tags' },
      { '<leader>fr', '<cmd>FzfLua resume<cr>', desc = 'Resume last search' },
      { '<leader>fl', '<cmd>FzfLua blines<cr>', desc = 'Lines in buffer' },
    },
    opts = {},
  },

  -- Syntax-aware highlighting for reading code and Markdown.
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'lua', 'vim', 'vimdoc', 'bash', 'json', 'yaml', 'toml',
        'markdown', 'markdown_inline',
      },
      auto_install = true,
      highlight = { enable = true },
    },
  },

  -- Markdown: in-buffer rendering (no browser) for everyday viewing in cmux.
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'markdown' },
    opts = {},
  },

  -- Markdown: true browser preview, live-updates as you type.
  -- Pure-Lua, no NodeJS/Python. Requires Neovim >= 0.10.1.
  -- `:LivePreview start` opens the preview; `<leader>mp` toggles it.
  {
    'brianhuster/live-preview.nvim',
    cmd = 'LivePreview',
    keys = {
      { '<leader>mp', '<cmd>LivePreview start<cr>', desc = 'Markdown preview (browser)' },
    },
    opts = {},
  },
}, {
  -- lazy.nvim UI/behaviour
  change_detection = { notify = false },
})

-- ----------------------------------------------------------------------------
-- Adding LSP later (optional, per-language)
-- ----------------------------------------------------------------------------
-- Neovim ships a built-in LSP client. To enable completion/diagnostics for a
-- language, add these plugins to the spec above and configure servers:
--
--   { 'neovim/nvim-lspconfig' },
--   { 'williamboman/mason.nvim', opts = {} },
--   { 'williamboman/mason-lspconfig.nvim', opts = { ensure_installed = { 'lua_ls' } } },
--
-- Then e.g. `require('lspconfig').lua_ls.setup({})`.
