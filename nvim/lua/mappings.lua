require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- moving between buffers
map("n", "<s-h>", "<cmd> bnext <cr>")
map("n", "<s-l>", "<cmd> bprevious <cr>")

-- navigate within insert mode
map("i", "<c-h>", "<left>")
map("i", "<c-l>", "<right>")
map("i", "<c-j>", "<down>")
map("i", "<c-k>", "<up>")

-- Paste from clipboard
map("n", "<leader>sp", '"+p')
map("n", "<leader>sP", '"+P')

-- Resize with arrows
map("n", "<c-up>", ":resize -2<cr>")
map("n", "<c-down>", ":resize +2<cr>")
map("n", "<c-left>", ":vertical resize -2<cr>")
map("n", "<c-right>", ":vertical resize +2<cr>")

-- Move text up and down
map("n", "<a-j>", "<esc>:m .+1<cr>==g")
map("n", "<a-k>", "<esc>:m .-2<cr>==g")

-- Visual --
-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
