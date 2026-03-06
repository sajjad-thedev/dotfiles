return {
  {
    dir = vim.fn.stdpath("config"),
    name = "css-vars-autocomplete",
    config = function()
      -- Function to get CSS variables from variables.css
      local function get_css_variables()
        local variables = {}
        local current_file = vim.api.nvim_buf_get_name(0)
        local css_dir = vim.fn.fnamemodify(current_file, ":h")

        -- If in pages subdirectory, go up one level
        if css_dir:match("pages$") then
          css_dir = vim.fn.fnamemodify(css_dir, ":h")
        end

        local variables_file = css_dir .. "/variables.css"

        if vim.fn.filereadable(variables_file) == 1 then
          local lines = vim.fn.readfile(variables_file)
          for _, line in ipairs(lines) do
            for var in line:gmatch("%-%-([%w%-_]+)%s*:") do
              table.insert(variables, "--" .. var)
            end
          end
        end

        return variables
      end

      -- Custom completion function
      local function css_complete(findstart, base)
        if findstart == 1 then
          local line = vim.api.nvim_get_current_line()
          local col = vim.api.nvim_win_get_cursor(0)[2]

          local start = col
          while start > 0 do
            local char = line:sub(start, start)
            if char:match("[%s,;{():]") then
              break
            end
            start = start - 1
          end

          return start
        else
          local variables = get_css_variables()
          local matches = {}

          for _, var in ipairs(variables) do
            if var:find(base, 1, true) or base == "" then
              table.insert(matches, {
                word = "var(" .. var .. ")",
                abbr = var,
                kind = "variable",
                menu = "[CSS Var]",
              })
            end
          end

          return matches
        end
      end

      -- Make function globally accessible
      _G.css_complete = css_complete

      -- Set up for CSS files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "css", "scss", "less" },
        callback = function()
          vim.bo.completefunc = "v:lua.css_complete"

          -- Auto-trigger completion when typing --
          vim.api.nvim_create_autocmd("TextChangedI", {
            buffer = 0,
            callback = function()
              local line = vim.api.nvim_get_current_line()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = line:sub(1, col)

              -- Trigger when typing -- or var(--
              if before_cursor:match("%-%-[%w%-]*$") or before_cursor:match("var%(%-%-[%w%-]*$") then
                vim.schedule(function()
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-x><C-u>", true, false, true), "n")
                end)
              end
            end,
          })
        end,
      })
    end,
  },
}
