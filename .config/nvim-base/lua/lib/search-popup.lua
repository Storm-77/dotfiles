local M = {}

vim.api.nvim_set_hl(0, "SearchPopupNormal", { bg = "none" })

function M.open(paths, window_title)
	local buffer = vim.api.nvim_create_buf(false, true)
	local width = math.min(100, math.floor(vim.o.columns * 0.8))
	local height = math.min(20, math.floor(vim.o.lines * 0.6))
	local separator = string.rep("-", width)
	local window = vim.api.nvim_open_win(buffer, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
		title = string.format(" %s ", window_title),
		title_pos = "center",
	})
	local selected, matches = 1, {}
	local rendering, refresh_scheduled = false, false

	vim.bo[buffer].bufhidden = "wipe"
	vim.bo[buffer].buftype = "nofile"
	vim.bo[buffer].swapfile = false
	vim.bo[buffer].undolevels = -1
	vim.wo[window].cursorline = false
	vim.wo[window].wrap = false
	vim.wo[window].winhighlight = "NormalFloat:SearchPopupNormal"

	local function render(focus_result)
		local query = vim.api.nvim_buf_get_lines(buffer, 0, 1, false)[1] or ""
		local filtered_matches = {}
		local positions = {}
		if query ~= "" then
			local fuzzy = vim.fn.matchfuzzypos(paths, query)
			filtered_matches = fuzzy[1]
			positions = fuzzy[2]
		end
		matches = filtered_matches
		selected = math.min(selected, math.max(#matches, 1))

		rendering = true
		local lines = { separator }
		vim.list_extend(lines, matches)
		vim.api.nvim_buf_set_lines(buffer, 1, -1, false, lines)
		rendering = false
		vim.api.nvim_buf_clear_namespace(buffer, -1, 0, -1)
		vim.api.nvim_buf_add_highlight(buffer, -1, "Title", 0, 0, -1)
		vim.api.nvim_buf_add_highlight(buffer, -1, "FloatBorder", 1, 0, -1)

		for index, path_positions in ipairs(positions) do
			local line = index + 1
			if index == selected then
				vim.api.nvim_buf_add_highlight(buffer, -1, "PmenuSel", line, 0, -1)
			end
			for _, column in ipairs(path_positions) do
				vim.api.nvim_buf_add_highlight(buffer, -1, "Search", line, column, column + 1)
			end
		end

		if focus_result and #matches > 0 then
			vim.api.nvim_win_set_cursor(window, { selected + 2, 0 })
		end
	end

	local function close()
		if vim.api.nvim_win_is_valid(window) then
			vim.api.nvim_win_close(window, true)
		end
	end

	local function choose()
		local path = matches[selected]
		if not path then
			return
		end
		vim.cmd.stopinsert()
		close()
		vim.cmd.edit(vim.fn.fnameescape(path))
	end

	local function move_selection(delta)
		if #matches == 0 then
			return
		end
		selected = ((selected - 1 + delta) % #matches) + 1
		render(true)
	end

	local function move_from_insert(delta)
		vim.cmd.stopinsert()
		vim.schedule(function()
			if vim.api.nvim_win_is_valid(window) then
				move_selection(delta)
			end
		end)
	end

	local function enter_query()
		local query = vim.api.nvim_buf_get_lines(buffer, 0, 1, false)[1] or ""
		vim.api.nvim_win_set_cursor(window, { 1, #query })
		vim.cmd("startinsert!")
	end

	vim.api.nvim_buf_attach(buffer, false, {
		on_lines = function()
			if rendering or refresh_scheduled then
				return
			end
			refresh_scheduled = true
			vim.schedule(function()
				refresh_scheduled = false
				if vim.api.nvim_buf_is_valid(buffer) then
					selected = 1
					render()
				end
			end)
		end,
	})

	local map_opts = { buffer = buffer }
	vim.keymap.set("n", "<Esc>", close, map_opts)
	vim.keymap.set({ "i", "n" }, "<CR>", choose, map_opts)
	vim.keymap.set("n", "i", enter_query, map_opts)
	vim.keymap.set("n", "a", function()
		if vim.api.nvim_win_get_cursor(window)[1] == 1 then enter_query() end
	end, map_opts)
	for _, mapping in ipairs({ { "<C-n>", 1 }, { "<C-p>", -1 }, { "j", 1 }, { "k", -1 } }) do
		local key, delta = mapping[1], mapping[2]
		vim.keymap.set("n", key, function() move_selection(delta) end, map_opts)
	end
	vim.keymap.set("i", "<C-n>", function() move_from_insert(1) end, map_opts)
	vim.keymap.set("i", "<C-p>", function() move_from_insert(-1) end, map_opts)
	vim.keymap.set("i", "<Up>", "<Nop>", map_opts)
	vim.keymap.set("i", "<Down>", "<Nop>", map_opts)
	for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
		vim.keymap.set("n", key, "<Nop>", map_opts)
	end

	vim.api.nvim_buf_set_lines(buffer, 0, -1, false, { "" })
	render()
	vim.cmd.startinsert()
end

return M
