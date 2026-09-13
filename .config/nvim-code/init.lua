local home = os.getenv("HOME") or os.getenv("USERPROFILE")
vim.opt.rtp:append(home .. "/.config/nvim-base")

require("base.remap")
require("base.options")
require("base.autocmd")

require("me")
