# neoconf-lspcmd

**neoconf-lspcmd** is a [neoconf.nvim](https://github.com/folke/neoconf.nvim/) plugin to manage LSP cmd settings via configuration files

## 📦 Installation

Install the plugin with your preferred package manager:

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
  {
    "folke/neoconf.nvim",

    dependencies = {
      { "ryansch/neoconf-lspcmd" },
      { "nvim-lua/plenary.nvim" },
    },

    config = function(_, opts)
      require("neoconf").setup(opts)
      require("neoconf.plugins").register(require("neoconf-lspcmd"))
    end,
  },
```

## ⚙️ Configuration

**neoconf-lspcmd** comes with the following defaults:

```lua
  {
    "folke/neoconf.nvim",

    dependencies = {
      { "ryansch/neoconf-lspcmd" },
      { "nvim-lua/plenary.nvim" },
    },

    opts = function(_, opts)
      opts.plugins = vim.tbl_extend("force", opts.plugins or {}, {
        lspcmd = {
          enabled = true,
          log_level = "info",
          ls_mappings = {
            standardrb = "standardRuby",
          },
        },
      })
    end,

    config = function(_, opts)
      require("neoconf").setup(opts)
      require("neoconf.plugins").register(require("neoconf-lspcmd"))
    end,
  },
```
