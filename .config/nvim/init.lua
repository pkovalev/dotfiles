local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = '\\'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamed"
vim.wo.relativenumber = true

require("lazy").setup({
spec = {
        {import = "plugins/telescope"},
        {import = "plugins/treesitter"},
        {import = "plugins/lualine"},
        {import = "plugins/indent-blankline"},
        {import = "plugins/mason-lspconfig"},
        {"catppuccin/nvim", name = "catppuccin", priority = 1000}
    }
})

vim.cmd.colorscheme "catppuccin-mocha"

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
