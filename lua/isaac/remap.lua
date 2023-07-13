vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "q", "<C-V>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "F1", "<nop>")

P = function(thing)
  vim.pretty_print(vim.inspect(thing))
  return thing
end
