require('kanagawa').setup({
  overrides = function(colors)
    return {
      LineNr = { bg = "none" },
    }
  end,
  theme = 'wave'
})

vim.cmd("colorscheme kanagawa")
