if true then
  return {}
end
return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufEnter",
  opts = {
    enable = false,
  },
}
