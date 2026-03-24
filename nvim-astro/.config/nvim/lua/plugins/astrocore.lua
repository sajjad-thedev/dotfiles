---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        colorcolumn = "80",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- Nvim-surround keybindings
        ["gsa"] = { "<Plug>(nvim-surround-normal)", desc = "Add surround" },
        ["gsd"] = { "<Plug>(nvim-surround-delete)", desc = "Delete surround" },
        ["gsc"] = { "<Plug>(nvim-surround-change)", desc = "Change surround" },
        -- keep cursor centered when searching
        ["n"] = { "nzzzv", desc = "Next search result centered" },
        ["N"] = { "Nzzzv", desc = "Prev search result centered" },
        -- picker keybindings
        ["<Leader><Space>"] = { function() require("snacks").picker.files() end, desc = "Find files" },
        ["<Leader>sb"] = { function() require("snacks").picker.lines() end, desc = "Search buffer" },
        ["<Leader>sg"] = { function() require("snacks").picker.grep() end, desc = "Live grep" },

        -- Scrolling and centering the cursor
        ["<C-d>"] = { "<C-d>zz", desc = "Scroll down and center" },
        ["<C-u>"] = { "<C-u>zz", desc = "Scroll up and center" },

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },
        -- grug-far project search/replace
        ["<Leader>sr"] = { function() require("grug-far").open() end, desc = "Search & replace" },

        -- todo-comments navigation
        ["]t"] = { function() require("todo-comments").jump_next() end, desc = "Next TODO" },
        ["[t"] = { function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
      },
      v = {
        ["gsa"] = { "<Plug>(nvim-surround-visual)", desc = "Add surround" },
        ["gsd"] = { "<Plug>(nvim-surround-delete)", desc = "Delete surround" },
        ["gsc"] = { "<Plug>(nvim-surround-change)", desc = "Change surround" },
        ["p"] = { '"_dP', desc = "Paste without yanking" },
      },
      i = {
        ["<C-;>"] = { "<Esc>A;<Esc>", desc = "Append semicolon from insert" },
        ["\027[27;5;59~"] = { "<Esc>A;<Esc>", desc = "Append semicolon from insert (tmux)" },
      },
    },
  },
}
