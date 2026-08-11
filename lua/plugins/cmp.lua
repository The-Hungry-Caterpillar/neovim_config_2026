return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({

      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if MiniSnippets.session.get() then
            MiniSnippets.session.jump("next")
          elseif cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if MiniSnippets.session.get() then
            MiniSnippets.session.jump("prev")
          elseif cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      snippet = {
        expand = function(args)
          local insert = MiniSnippets.config.expand.insert
          or MiniSnippets.default_insert

          insert({ body = args.body })

          cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          require("cmp.config").set_onetime({ sources = {} })
        end,
      },

      window = {
        completion = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          border = "rounded",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
        }),
      },

      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      },

    })

    cmp.setup.filetype("markdown", {
      completion = {
        autocomplete = false
      }
    })

  end,
}
