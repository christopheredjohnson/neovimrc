--------------------------------------------------------------------------------
-- BOOTSTRAP PLUGIN MANAGER
--------------------------------------------------------------------------------

-- install the lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_is_installed = vim.loop.fs_stat(lazypath)
if not lazy_is_installed then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

--------------------------------------------------------------------------------
-- CONFIGURE KEYMAPS
--------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- windows
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split current window vertically" })
map("n", "<leader>wh", "<cmd>split<cr>", { desc = "Split current window horizontally" })
map("n", "<leader>w=", "<C-W>=", { desc = "Make windows equal size" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "n", "s", "x" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

--------------------------------------------------------------------------------
-- NEOVIM OPTIONS
--------------------------------------------------------------------------------

-- cursor
vim.opt.cursorline = true

-- relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- window split behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- disable tab visibility
vim.opt.showtabline = 0

-- yank/paste behavior
vim.opt.clipboard = "unnamedplus"

-- persistent undo
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- disable mouse support
vim.opt.mouse = ""

-- autowrite
vim.opt.autowrite = true

-- insert mode completion behavior
vim.opt.completeopt:append({ "menuone", "noselect" })

-- hide * markup for bold and italic
vim.opt.conceallevel = 3

-- confirm to save changes before exiting modified buffer
vim.opt.confirm = true

-- search case sensitivity
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- grep configuration
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

-- popup menu
vim.pumheight = 10

-- short message format
vim.opt.shortmess:append({ a = true, c = true, I = true, W = true })
--------------------------------------------------------------------------------
-- AUTO COMMANDS
--------------------------------------------------------------------------------

local function augroup(name)
	return vim.api.nvim_create_augroup("Init" .. name, { clear = true })
end

--------------------------------------------------------------------------------
-- LOAD PLUGINS
--------------------------------------------------------------------------------

require("lazy").setup({ { import = "plugins" } }, {
	install = { colorscheme = { "terrafox" } },
	concurrency = #vim.loop.cpu_info(),
	checker = { enabled = true, concurrency = #vim.loop.cpu_info(), notify = false },
	change_detection = { notify = false },
})
