-- all ui optimizations should go here.
-- snacks file explorer width decrease
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            -- Adjust layout specifically for the explorer
            layout = {
              layout = {
                -- 30 is the number of columns.
                -- You can also use a decimal like 0.2 for 20% of the screen.
                width = 0.24,
                min_width = 0.18,
              },
            },
          },
        },
      },
    },
  },
}
