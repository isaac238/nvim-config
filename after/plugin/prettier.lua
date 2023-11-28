local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd', -- or `'prettier'`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
	"go",
	"svelte",
  },
  cli_options = {
	  tab_width = 4,
  }
})
