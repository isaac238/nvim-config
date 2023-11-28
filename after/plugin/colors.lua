require ('colorizer').setup({
	user_default_options = {
		tailwind = true,
	},
})

require("tailwindcss-colorizer-cmp").setup()

require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}

