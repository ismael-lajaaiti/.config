return {
  "kaarmu/typst.vim",
  ft = "typst",
  config = function()
    vim.g.typst_pdf_viewer = "zathura"
  end,
  lazy = false,
}
