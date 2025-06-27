-- Clear existing highlights
vim.cmd [[highlight clear]]
vim.cmd [[syntax reset]]
vim.g.colors_name = 'minimal'

-- local colors = {
--     bg = '#1D2021',
--     fg = '#D5C4A1',
--     red = '#C7534E',
--     blue = '#458588',
--     green_light = '#98971A',
--     purple = '#B16286',
--     yellow = '#D79921',
--     orange = '#D65D0E',
--     green = '#44B340',
--     grey = '#928374',
-- }

local colors = {
    bg = '#1D2021',
    fg = '#EBDBB2',
    red = '#FB4934',
    blue = '#83A598',
    green_light = '#B8BB26',
    purple = '#D3869B',
    yellow = '#FABD2F',
    orange = '#FE8019',
    green = '#44B340',
    grey = '#928374',
}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

set_hl('CursorLine', { bg = colors.bg })
set_hl('LineNr', { fg = colors.grey })
set_hl('Normal', { fg = colors.fg, bg = colors.bg })
set_hl('Pmenu', { fg = colors.fg, bg = colors.bg })
set_hl('PmenuSel', { fg = colors.fg, bg = colors.bg })
set_hl('Search', { fg = colors.fg, bg = colors.bg })
set_hl('StatusLine', { fg = colors.fg, bg = colors.bg })
set_hl('StatusLineNC', { fg = colors.fg, bg = colors.bg })

set_hl('Comment', { fg = colors.green })
set_hl('Constant', { fg = colors.purple })
set_hl('Delimiter', { fg = colors.fg })
set_hl('Function', { fg = colors.yellow })
set_hl('Identifier', { fg = colors.fg })
set_hl('Keyword', { fg = colors.red })
set_hl('Number', { fg = colors.purple })
set_hl('Operator', { fg = colors.fg })
set_hl('PreProc', { fg = colors.fg })
set_hl('Punctuation', { fg = colors.fg })
set_hl('Special', { fg = colors.fg })
set_hl('String', { fg = colors.green_light })
set_hl('Type', { fg = colors.fg })

set_hl('@variable', { fg = colors.fg })

return {}
