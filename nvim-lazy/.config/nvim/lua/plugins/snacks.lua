return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          header = [[
███████╗ █████╗      ██╗     ██╗ █████╗ ██████╗
██╔════╝██╔══██╗     ██║     ██║██╔══██╗██╔══██╗
███████╗███████║     ██║     ██║███████║██║  ██║
╚════██║██╔══██║██   ██║██   ██║██╔══██║██║  ██║
███████║██║  ██║╚█████╔╝╚█████╔╝██║  ██║██████╔╝
╚══════╝╚═╝  ╚═╝ ╚════╝  ╚════╝ ╚═╝  ╚═╝╚═════╝
          ]],
        },
      },
      picker = {
        enabled = true,
        hidden = true,
        ignored = false,
        sources = {
          explorer = {
            layout = {
              layout = {
                width = 30,
                min_width = 20,
              },
            },
          },
          files = {
            hidden = true,
            exclude = { ".git" },
          },
        },
      },
      explorer = {
        enabled = true,
        hidden = true,
      },
    },
    keys = {
      -- Explorer toggle
      { "<leader>e",  function() Snacks.explorer() end,                                 desc = "Explorer Snacks (Root Dir)" },
      { "<leader>E",  function() Snacks.explorer({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Explorer Snacks (CWD)" },
      -- Scratchpad
      { "<leader>.",  function() Snacks.scratch() end,                                  desc = "Toggle Scratchpad" },
      -- Notifier history
      { "<leader>un", function() Snacks.notifier.show_history() end,                    desc = "Notification History" },
    },
  },
}
