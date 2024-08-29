return {
  "L3MON4D3/LuaSnip",
  config = function()
    local luasnip = require("luasnip")
    luasnip.config.set_config({
      history = false,
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
      region_check_events = "InsertEnter",
      delete_check_events = "InsertLeave",
    })
    local loader = require("luasnip.loaders.from_lua")
    loader.load({ paths = "~/.config/nvim/snippets/" })
  end,
}
