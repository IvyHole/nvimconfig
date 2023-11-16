local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
    -- nvim-tree
    ["n|<A-m>"] = map_cr('NvimTreeOpen'):with_silent():with_desc("Nvim-tree: open file tree"),

    -- undo-tree
    ["n|<F5>"] = map_cr('UndotreeToggle'):with_silent():with_desc("Nvim-tree: open undo tree"),



    -- bufferline
    ["n|<A-j>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent():with_desc("buffer: Switch to next"),
	["n|<A-k>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent():with_desc("buffer: Switch to prev"),
	["n|<A-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent():with_desc("buffer: Move current to next"),
	["n|<A-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent():with_desc("buffer: Move current to prev"),
	["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap():with_desc("buffer: Sort by extension"),
	["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap():with_desc("buffer: Sort by direrctory"),
    ["n|<leader>cl"] = map_cr("BufferLineCloseLeft"):with_noremap():with_desc("buffer: close left"),
    ["n|<leader>cr"] = map_cr("BufferLineCloseRight"):with_noremap():with_desc("buffer: close right"),
    ["n|<leader>ca"] = map_cr("BufferLineCloseRight<CR>:BufferLineCloseLeft"):with_noremap():with_desc("buffer: close all"),
	["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent():with_desc("buffer: Goto buffer 1"),
	["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent():with_desc("buffer: Goto buffer 2"),
	["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent():with_desc("buffer: Goto buffer 3"),
	["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent():with_desc("buffer: Goto buffer 4"),
	["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent():with_desc("buffer: Goto buffer 5"),
	["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent():with_desc("buffer: Goto buffer 6"),
	["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent():with_desc("buffer: Goto buffer 7"),
	["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent():with_desc("buffer: Goto buffer 8"),
	["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent():with_desc("buffer: Goto buffer 9"),


    -- telescope
    -- Plugin: telescope
	["n|<C-p>"] = map_callback(function()
        _command_panel()
        end)
        :with_noremap()
        :with_silent()
        :with_desc("tool: Toggle command panel"),
    ["n|<leader>u"] = map_callback(function()
            require("telescope").extensions.undo.undo()
        end)
        :with_noremap()
        :with_silent()
        :with_desc("edit: Show undo history"),
    ["n|<leader>fp"] = map_callback(function()
            require("telescope").extensions.projects.projects({})
        end)
        :with_noremap()
        :with_silent()
        :with_desc("find: Project"),
    ["n|<leader>fr"] = map_callback(function()
            require("telescope").extensions.frecency.frecency({})
        end)
        :with_noremap()
        :with_silent()
        :with_desc("find: File by frecency"),
    ["n|<leader>fw"] = map_callback(function()
            require("telescope").extensions.live_grep_args.live_grep_args()
        end)
        :with_noremap()
        :with_silent()
        :with_desc("find: Word in project"),
    ["n|<leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent():with_desc("find: File by history"),
    ["n|<leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent():with_desc("find: File in project"),
    ["n|<leader>fc"] = map_cu("Telescope colorscheme")
        :with_noremap()
        :with_silent()
        :with_desc("ui: Change colorscheme for current session"),
    ["n|<leader>fn"] = map_cu(":enew"):with_noremap():with_silent():with_desc("buffer: New"),
    ["n|<leader>fz"] = map_cu("Telescope zoxide list")
        :with_noremap()
        :with_silent()
        :with_desc("edit: Change current direrctory by zoxide"),
    ["n|<leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent():with_desc("find: Buffer opened"),
    ["n|<leader>fs"] = map_cu("Telescope grep_string"):with_noremap():with_silent():with_desc("find: Current word"),
    ["n|<leader>fd"] = map_cu("Telescope persisted"):with_noremap():with_silent():with_desc("find: Session"),
    ["n|<leader>fg"] = map_cu("GrepInDirectory"):with_noremap():with_silent():with_desc("find: words in dir"),
    ["n|<leader>pd"] = map_cu("FileInDirectory"):with_noremap():with_silent():with_desc("find: file in dir"),


    -- persisted
	["n|<leader>ss"] = map_cu("SessionSave"):with_noremap():with_silent():with_desc("session: Save"),
	["n|<leader>sl"] = map_cu("SessionLoad"):with_noremap():with_silent():with_desc("session: Load current"),
	["n|<leader>sd"] = map_cu("SessionDelete"):with_noremap():with_silent():with_desc("session: Delete"),


    -- myword
    ["n|<A-h>"] = map_cr("lua require'mywords'.hl_toggle()"):with_silent():with_desc("myword: toggle highlight world"),
    ["n|<A-g>"] = map_cr("lua require'mywords'.uhl_all()"):with_silent():with_desc("myword: unhighlight all worlds"),

}

bind.nvim_load_mapping(plug_map)
