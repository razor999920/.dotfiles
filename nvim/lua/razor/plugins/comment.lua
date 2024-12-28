return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    -- import comment plugin safely
    local comment = require 'Comment'

    local ts_context_commentstring = require 'ts_context_commentstring.integrations.comment_nvim'

    -- enable comment
    -- To use it you need to use 'gc' + ('number + motion' or 'c')
    comment.setup {
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    }
  end,
}
