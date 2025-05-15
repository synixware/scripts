vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Resize with arrows
-- delta: 2 lines
keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Reduce window height by 2 lines" })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Increase window height by 2 lines" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Reduce window width by 2 columns" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width by 2 columns" })

-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- buffers
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Go to next buffer" }) --  go to next buffer
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" }) --  go to previous buffer
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" }) --  delete current buffer

--  move text up and down
keymap.set("n", "<A-Up>", ":move-2<CR>", { desc = "Move text up" })
keymap.set("n", "<A-Down>", ":move+1<CR>", { desc = "Move text down" })
keymap.set("v", "<A-Up>", ":move '<-2<CR>gv", { desc = "Move text up" })
keymap.set("v", "<A-Down>", ":move '>+1<CR>gv", { desc = "Move text down" })

-- term
keymap.set("n", "<A-1>", ":ToggleTerm 1<CR>")
keymap.set("n", "<A-2>", ":ToggleTerm 2<CR>")
keymap.set("n", "<A-3>", ":ToggleTerm 3<CR>")
