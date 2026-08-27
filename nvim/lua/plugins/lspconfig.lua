return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_tex = false,
    },
    servers = {
      nil_ls = { mason = false },
    },
  },
}
