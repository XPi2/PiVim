local api = vim.api
local cmd = vim.cmd
local opt = vim.opt

api.nvim_set_keymap("n", "<leader>w", "<C-w>", { noremap = true }) -- Windows commands
api.nvim_set_keymap("n", "<leader><Tab>", "<cmd>bn <cr>", { noremap = true }) -- Tab commands

-- Terminal
api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", { noremap = true })
api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true })

-- Code manipulation
api.nvim_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<cr>", {noremap = true})

-- Telescope
--- Files
api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope help_tags<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>fp", "<cmd>lua require'telescope'.extensions.repo.list{}<cr>", {noremap = true})

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})

-- Git
api.nvim_set_keymap("n", "<leader>gst", "<cmd>Telescope git_status<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", {noremap = true})


-- api.nvim_set_keymap("n", "<leader>c", "<cmd>Format <cr>", {noremap = true}) -- Format when lsp fail

