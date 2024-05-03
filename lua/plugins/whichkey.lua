return {
	'folke/which-key.nvim',
	config = function(_, opts)
		local wk = require('which-key')
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
	init = function()
		vim.opt.timeout = true
		vim.opt.timeoutlen = 300
	end,
	opts = {
		defaults = {
			mode = { 'n', 'v' }
		}
	}
}
