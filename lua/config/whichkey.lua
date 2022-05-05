local M = {}

local whichkey = require "which-key"
local next = next

local conf = {
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
}
whichkey.setup(conf)

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
  local keymap_f = nil -- File search
  local keymap_p = nil -- Project search

  local keymap = {
    v = {
      name = "Vimspector",
      G = { "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>", "Generate Debug Profile" },
      I = { "<cmd>VimspectorInstall<cr>", "Install" },
      U = { "<cmd>VimspectorUpdate<cr>", "Update" },
      R = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor" },
      c = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
      i = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
      o = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
      s = { "<cmd>call vimspector#Launch()<cr>", "Start" },
      t = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
      u = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
      S = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
      r = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
      x = { "<cmd>VimspectorReset<cr>", "Reset" },
      H = { "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>", "Toggle HUMAN mode" },
    },
  }
  whichkey.register(keymap, opts)
end

function M.setup()
  normal_keymap()
end

return M
