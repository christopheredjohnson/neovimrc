return {
	{ "EdenEast/nightfox.nvim" },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function(_, opts)
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'lua',
                    'vim',
                    'vimdoc',
                },
            })
        end,
        build = ':TSUpdate'
    }
}
