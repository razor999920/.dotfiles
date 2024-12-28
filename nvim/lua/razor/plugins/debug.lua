-- debug.lua
--
-- shows how to use the dap plugin to debug your code.
--
-- primarily focused on configuring the debugger for go, but can
-- be extended to other languages as well. that's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- note: yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- note: and you can specify dependencies as well
  dependencies = {
    -- creates a beautiful debugger ui
    'rcarriga/nvim-dap-ui',

    -- installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- add your own debuggers here
    'leoluz/nvim-dap-go',

    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<f5>', dap.continue, { desc = 'debug: start/continue' })
    vim.keymap.set('n', '<f1>', dap.step_into, { desc = 'debug: step into' })
    vim.keymap.set('n', '<f2>', dap.step_over, { desc = 'debug: step over' })
    vim.keymap.set('n', '<f3>', dap.step_out, { desc = 'debug: step out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'debug: toggle breakpoint' })
    vim.keymap.set('n', '<leader>b', function()
      dap.set_breakpoint(vim.fn.input 'breakpoint condition: ')
    end, { desc = 'debug: set breakpoint' })

    -- dap ui setup
    -- for more information, see |:help nvim-dap-ui|
    dapui.setup()

    -- toggle to see last session result. without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<f7>', dapui.toggle, { desc = 'debug: see last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- install golang specific config
    require('dap-go').setup()
  end,
}
