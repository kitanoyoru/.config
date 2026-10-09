local keys = require("custom_keys")

local builtin = require('telescope.builtin')

local function set_keymap()
	vim.keymap.set('n', keys.open_netrw, ":Oil<CR>", {})
  
	vim.keymap.set('n', keys.find_files, builtin.find_files, {})
	vim.keymap.set('n', keys.live_grep, builtin.live_grep, {})
	vim.keymap.set('n', keys.buffers, builtin.buffers, {})
	vim.keymap.set('n', keys.help_tags, builtin.help_tags, {})

	vim.keymap.set('n', keys.prev_tab, ":bprevious<CR>", {})
	vim.keymap.set('n', keys.next_tab, ":bnext<CR>", {})
	vim.keymap.set('n', keys.close_tab, ":bdelete<CR>", {})

end

set_keymap()
