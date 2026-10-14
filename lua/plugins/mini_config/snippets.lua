local snippets = require("mini.snippets")

snippets.setup({
  snippets = {
    {
      prefix = "head",
      body = {
        "# ------------------------------------------------------------------------------",
        "# ${1:Insert here}",
        "# ------------------------------------------------------------------------------",
      },
      desc = "Section divider",
    },

    {
      prefix = "png",
      body = {
        'png(',
        '  filename = "${1}",',
        "  height   = ${2},",
        "  width    = ${3},",
        '  units    = "in",',
        "  res      = 300",
        ")",
        "${4}",
        "dev.off()",
        "${0}",
      },
      desc = "PNG device",
    },

    {
      prefix = "lap",
      body = {
        "lapply(",
        "  ${1:# Insert here},",
        "  \\(${2:x}) {",
        "    ${3}",
        "  }",
        ")",
        "${0}",
      },
      desc = "lapply anonymous function",
    },

    {
      prefix = "iwalk",
      body = {
        "iwalk(",
        "  ${1:# Insert here},",
        "  \\(${2:x}, name) {",
        "    ${3}",
        "  }",
        ")",
        "${0}",
      },
      desc = "iwalk anonymous function"
    },

    {
      prefix = "lib",
      body = {
        "library(tidyverse)",
        "library(glue)",
        "${0}",
      },
      desc = "libraries"
    },

    {
      prefix = "T",
      body = {
        "TRUE${0}"
      },
      desc = "boolean true"
    },

    {
      prefix = "F",
      body = {
        "FALSE${0}"
      },
      desc = "boolean false"
    },

    {
      prefix = "run_limma",
      body = {
        "run_limma(",
        "  mtx             = ${1},",
        "  meta            = ${2},",
        "  variable        = ${3},",
        "  numerator       = ${4},",
        "  denominator     = ${5},",
        "  output_dir      = ${6},",
        "  output_prefix   = ${7},",
        "  overwrite       = TRUE,",
        "  plotting_p_type = '${8:P.Value}',",
        "  plotting_p_cut  = ${9:0.05},",
        "  gsea_files      = c(",
        "    './input/msigdb_v2023.2.Hs_GMTs/h.all.v2023.2.Hs.symbols.gmt',",
        "    './input/msigdb_v2023.2.Hs_GMTs/c2.cp.v2023.2.Hs.symbols.gmt'",
        "  )",
        ")",
        "${0}",
      },
      desc = "run_limma from whircLimma package"
    },
  }
})
MiniSnippets.start_lsp_server({ match = false })
