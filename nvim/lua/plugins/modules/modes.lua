return {
  "mvllow/modes.nvim",
  tag = "v0.2.0",
  event = "BufEnter",
  config = function()
    require("modes").setup()
  end,
}
