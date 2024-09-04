return {
  {
    "jpalardy/vim-slime",
    keys = {
      { "<leader>sC", "<cmd>SlimeConfig<cr>", desc = "Configure Slime" },
      { "<leader>sp", "<Plug>SlimeParagraphSend<cr>))", desc = "Send paragraph and move" },
      { "<leader>su", "<Plug>SlimeLineSend<cr>", desc = "Send line and move" },

      {
        "<leader>sp",
        "<Plug>SlimeRegionSend<cr>k",
        mode = { "v" },
        desc = "Send region visually selected.",
      },
      { "<leader>sa", "ggVG<Plug>SlimeRegionSend<cr>gg", desc = "Send all buffer." },
    },
    -- commit = "150ab45",
    config = function()
      -- vim.keymap.set("v", "<leader>sr", "<Plug>SlimeRegionSend")
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = {
        socket_name = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
        target_pane = "{bottom-right}",
      }
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_python_ipython = 1
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_cell_delimiter = "```"
    end,
  },
}
