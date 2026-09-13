local ignore_patterns = {
	"node_modules",
	"%.git",
	"%.cache",
	"dist",
	"build",
	"%.tmp",
	"%.log",
}

local function find_files()
	local seen, files = {}, {}
	local paths = vim.list_extend(
        vim.fn.glob(".**", false, true), 
        vim.fn.glob("**", false, true)
    )

	for _, path in ipairs(paths) do

		local ignored = vim.iter(ignore_patterns):any(function(pattern)
			return path:match(pattern)
		end)

		if vim.fn.isdirectory(path) == 0 and not ignored and not seen[path] then
			seen[path] = true
			files[#files + 1] = path
		end

	end

	return files
end


local search_popup = require("lib.search-popup")

--fuzzy search
local function open_picker()
	search_popup.open(find_files(), "Search files")
end
vim.keymap.set("n", "<leader>pa", open_picker)

-- search git files
local function open_git_picker()
    local lines = vim.fn.systemlist({ 'git', 'ls-files' })
    print(lines)
    if vim.v.shell_error == 0 then
        search_popup.open(lines, "Git files")
    end
end
vim.keymap.set("n", "<C-p>", open_git_picker)
