--
require("full-border"):setup()

--
require("yatline-symlink"):setup()

--
require("yatline"):setup({
  section_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },
  inverse_separator = { open = "", close = "" },

  style_a = { fg = "black", bg_mode = { normal = "#8cc570", select = "#ecbe70", un_set = "#d0e" } },
  style_b = { bg = "#21262e", fg = "#8cc570" },
  style_c = { bg = "#272c35", fg = "#a9b2c0" },

  permissions_t_fg = "green",
  permissions_r_fg = "yellow",
  permissions_w_fg = "red",
  permissions_x_fg = "cyan",
  permissions_s_fg = "darkgray",

  tab_width = 200,
  tab_use_inverse = false,

  selected = { icon = "󰻭", fg = "yellow" },
  copied = { icon = "", fg = "green" },
  cut = { icon = "", fg = "red" },

  total = { icon = "󰮍", fg = "yellow" },
  succ = { icon = "", fg = "green" },
  fail = { icon = "", fg = "red" },
  found = { icon = "󰮕", fg = "blue" },
  processed = { icon = "󰐍", fg = "green" },

  show_background = true,

  display_header_line = false,
  display_status_line = true,

  header_line = {
    -- { type = "line", custom = false, name = "tabs", params = { "left" } },
    -- { type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
    -- { type = "string", custom = false, name = "date", params = { "%X" } },
    left = {
      section_a = {},
      section_b = {},
      section_c = {},
    },
    right = {
      section_a = {},
      section_b = {},
      section_c = {},
    },
  },

  status_line = {
    -- { type = "string", custom = false, name = "tab_mode" },
    -- { type = "coloreds", custom = false, name = "count" },
    -- { type = "string", custom = false, name = "cursor_percentage" },
    -- { type = "string", custom = false, name = "cursor_position" },
    left = {
      section_a = {},
      section_b = { { type = "string", custom = false, name = "hovered_size" } },
      section_c = { { type = "string", custom = false, name = "hovered_name" } },
    },
    right = {
      section_a = { { type = "coloreds", custom = false, name = "symlink" } },
      section_b = { { type = "string", custom = false, name = "hovered_file_extension", params = { true } } },
      section_c = { { type = "coloreds", custom = false, name = "permissions" } },
    },
  },
})

--
-- require("no-status"):setup()

--
-- require("yaziline"):setup({
--   separator_style = "empty", -- "angly" | "curvy" | "liney" | "empty"

--   separator_open = "", -- 
--   separator_close = "▎", -- 

--   separator_open_thin = "", -- 
--   separator_close_thin = "▎", -- 

--   select_symbol = "",
--   yank_symbol = "󰆐",
--   filename_max_length = 24, -- trim when filename > 24
--   filename_trim_length = 6  -- trim 6 chars from both ends
-- })
