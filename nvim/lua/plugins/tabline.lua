-- Tabline / Buffer line plugin
return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          custom_areas = {
            left = function()
              local colors = require('bufferline.colors').get_color({ name = 'TabLine', attribute = 'bg' })
              return {{ text = '  ', bg = colors }}
            end,
          },
          mode = 'tabs', -- Show tabs, not buffers
          numbers = 'none',
          themable = true, -- Allow colorscheme to style it
          close_command = 'bdelete! %d',
          right_mouse_command = 'bdelete! %d',
          left_mouse_command = 'buffer %d',
          middle_mouse_command = nil,
          indicator = {
            icon = '',
            style = 'none',
          },
          name_formatter = function(buf)
            return buf.name
          end,
          buffer_close_icon = '󰅖',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 30,
          max_prefix_length = 15,
          truncate_names = true,
          diagnostics = false,
          diagnostics_update_in_insert = false,
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              text_align = 'center',
              separator = true,
            },
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = false,
          show_duplicate_prefix = false,
          persist_buffer_sort = true,
          separator_style = { '', '' }, -- No separators for cleaner look
          enforce_regular_tabs = false,
          tab_size = 0, -- Minimize tab padding
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' },
          },
          sort_by = 'id',
        },
        highlights = {
          -- Use vim's native tabline colors
          fill = {
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          background = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          tab = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          tab_selected = {
            fg = { attribute = 'fg', highlight = 'TabLineSel' },
            bg = { attribute = 'bg', highlight = 'TabLineSel' },
            bold = true,
            italic = false,
          },
          tab_close = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          close_button = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          close_button_visible = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          close_button_selected = {
            fg = { attribute = 'fg', highlight = 'TabLineSel' },
            bg = { attribute = 'bg', highlight = 'TabLineSel' },
          },
          buffer_visible = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          buffer_selected = {
            fg = { attribute = 'fg', highlight = 'TabLineSel' },
            bg = { attribute = 'bg', highlight = 'TabLineSel' },
            bold = true,
            italic = false,
          },
          modified = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          modified_visible = {
            fg = { attribute = 'fg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          modified_selected = {
            fg = { attribute = 'fg', highlight = 'TabLineSel' },
            bg = { attribute = 'bg', highlight = 'TabLineSel' },
            bold = true,
            italic = false,
          },
          separator = {
            fg = { attribute = 'bg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          separator_selected = {
            fg = { attribute = 'bg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLineSel' },
          },
          separator_visible = {
            fg = { attribute = 'bg', highlight = 'TabLine' },
            bg = { attribute = 'bg', highlight = 'TabLine' },
          },
          indicator_selected = {
            fg = { attribute = 'fg', highlight = 'TabLineSel' },
            bg = { attribute = 'bg', highlight = 'TabLineSel' },
          },
        },
      })
    end,
  },
}
