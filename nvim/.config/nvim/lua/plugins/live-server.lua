return {
  "barrett-ruth/live-server.nvim",
  config = function()
    require("live-server").setup({
      args = { "--browser=xdg-open" },
    })
  end,
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<cr>", desc = "Live Server Start" },
    { "<leader>lS", "<cmd>LiveServerStop<cr>", desc = "Live Server Stop" },
  },
}
