vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.number = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true

opt.termguicolors = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.signcolumn = 'yes'
opt.scrolloff = 5
opt.undofile = true
opt.splitright = true
opt.splitbelow = true

local treesitter_parsers = {
  'lua', 'vim', 'vimdoc', 'bash', 'json', 'yaml', 'toml',
  'markdown', 'markdown_inline',
}

local treesitter_filetypes = {
  'lua', 'vim', 'vimdoc', 'bash', 'sh', 'json', 'yaml', 'toml',
  'markdown',
}

local keymaps = vim.fn.expand('~/.keymaps.vim')
if vim.fn.filereadable(keymaps) == 1 then
  vim.cmd('source ' .. keymaps)
end

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

require('lazy').setup({
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },

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

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })
      require('nvim-treesitter').install(treesitter_parsers)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = treesitter_filetypes,
        callback = function(event)
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ft = { 'markdown' },
    opts = {},
  },

  {
    'brianhuster/live-preview.nvim',
    cmd = 'LivePreview',
    keys = {
      { '<leader>mp', '<cmd>LivePreview start<cr>', desc = 'Markdown preview (browser)' },
    },
    opts = {},
  },
}, {
  change_detection = { notify = false },
})
