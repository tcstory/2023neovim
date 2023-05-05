local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
      ["<C-n>"] = "",
      ["<leader>e"] = ""
  }
}

M.nvimtree = {
  n = {
    ["<Leader>1"] = {"<Cmd>NvimTreeFocus<CR>"}
  }
}

return M
