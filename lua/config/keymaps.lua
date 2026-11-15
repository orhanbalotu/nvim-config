-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Reisize
vim.keymap.set("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Pencere yüksekliğini artır" })
vim.keymap.set("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Pencere yüksekliğini azalt" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Pencere genişliğini azalt" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Pencere genişliğini artır" })

-- Buffer Diff
vim.keymap.set("n", "<leader>bu", function()
  vim.cmd("vert new")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.cmd("read ++edit #")
  vim.cmd("0delete _")
  vim.cmd("diffthis")
  vim.cmd("wincmd p")
  vim.cmd("diffthis")
end, { desc = "Kaydedilmiş hâliyle karşılaştır" })

-- Mark improvment
for letter in ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"):gmatch(".") do
  local mark = letter

  vim.keymap.set("n", "m" .. mark, function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local bufnr = vim.api.nvim_get_current_buf()
    local pos = vim.fn.getpos("'" .. mark)

    local same_buffer = pos[1] == 0 or pos[1] == bufnr
    local same_position = pos[2] == cursor[1] and pos[3] == cursor[2] + 1

    if same_buffer and same_position then
      vim.cmd("delmarks " .. mark)
    else
      vim.cmd("normal! m" .. mark)
    end
  end, { desc = mark .. " işaretini koy/kaldır" })
end

-- Terminalden kolay cikis
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {
  desc = "Terminal normal moduna geç",
})
