-- Clear existing highlights
vim.cmd [[highlight clear]]
vim.cmd [[syntax reset]]
vim.g.colors_name = 'minimal'

local colors = {
    bg = '#062329',
    fg = '#d1b897',
    keyword = '#FFFFFF',
    strings = '#2ca198',
    numbers = '#9DE3C0',
    constants = '#d1b897',
    comment = '#44b340',
    types = '#14fda8',
}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

set_hl('Normal', { fg = colors.fg, bg = colors.bg })
set_hl('LineNr', { fg = colors.fg })
set_hl('CursorLine', { bg = '#2A3233' })
set_hl('Visual', { bg = '#3E4451' })
set_hl('StatusLine', { fg = colors.fg, bg = colors.bg })
set_hl('StatusLineNC', { fg = colors.comment, bg = colors.bg })

set_hl('Comment', { fg = colors.comment })
set_hl('Keyword', { fg = colors.keyword })
set_hl('String', { fg = colors.strings })
set_hl('Number', { fg = colors.numbers })
set_hl('Constant', { fg = colors.constants })
set_hl('Function', { fg = colors.fg })
set_hl('Delimiter', { fg = colors.fg })
set_hl('Punctuation', { fg = colors.fg })
set_hl('Type', { fg = colors.fg })
set_hl('Operator', { fg = colors.fg })
set_hl('Identifier', { fg = colors.fg })

-- Tree-sitter highlights
set_hl('@keyword', { link = 'Keyword' })
set_hl('@string', { link = 'String' })
set_hl('@function', { link = 'Function' })
set_hl('@number', { link = 'Number' })
set_hl('@constant', { link = 'Constant' })
set_hl('@variable', { link = 'Identifier' })
set_hl('@type', { fg = colors.types })
set_hl('@punctuation.delimiter', { link = 'Identifier' })
set_hl('@punctuation.bracket', { link = 'Identifier' })
set_hl('@punctuation.paren', { link = 'Identifier' })
set_hl('@punctuation.curly', { link = 'Identifier' })
set_hl('@keyword.storage', { fg = colors.types })
set_hl('@type.builtin', { fg = colors.types })
set_hl('@constant.builtin', { fg = colors.fg })
set_hl('@function.builtin', { fg = colors.fg })

return {}
