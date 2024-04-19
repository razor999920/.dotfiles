-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
--  You can configure plugins using the `config` key.
require('lazy').setup({{import = "razor.plugins"}, {import = "razor.plugins.lsp"}}, {
  ckecker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
