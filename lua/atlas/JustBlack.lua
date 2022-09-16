vim.cmd[[highlight clear]]

local highlight = function(group, bg, fg, attr)
    fg = fg and 'guifg=' .. fg or ''
    bg = bg and 'guibg=' .. bg or ''
    attr = attr and 'gui=' .. attr or ''

    vim.api.nvim_command('highlight ' .. group .. ' '.. fg .. ' ' .. bg .. ' '.. attr)
end

local link = function(target, group)
    vim.api.nvim_command('highlight! link ' .. target .. ' '.. group)
end

local Black1 = '#111111'
local Black2 = '#200a0e'
local Black3 = '#10130b'
local Black4 = '#1d1f28'
local Black5 = '#232638'
local Cyan = '#00ffff'
local CyanLight = '#7EFFFF'
local Fuchsia = '#FF0077'
local Green = '#7FFF00'
local GreenBlue = '#23AB6C'
local GreenLight = '#7EFF7E'
local GreenPastel = '#C3E88D'
local Grey1 = '#464B5D'
local Grey2 = '#666666'
local Grey3 = '#777777'
local Grey4 = '#7E7E7E'
local Grey5 = '#8F93A2'
local JustBlack = '#000000'
local Orange = '#FF8800'
local OrangeLight = '#F78C6C'
local Pink = '#FF00FF'
local Purple = '#BB77FF'
local Red = '#FF5370'
local RedLight = '#FF3B3B'
local White = '#ffffff'
local Yellow = '#FFFF00'
local YellowLight = '#FFFF7E'

highlight('Comment', nil, Grey1, 'italic')
highlight('Error', nil, Red, nil)
highlight('ErrorMsg', nil, White, nil)
highlight('WarningMsg', nil, Orange, 'bold')
highlight('Keyword', nil, Purple, nil)
highlight('TSCharacter', nil, OrangeLight, nil)
highlight('String', nil, GreenPastel, nil)
highlight('String', nil, Pink, nil)
highlight('Number', nil, Yellow, nil)
highlight('Include', nil, RedLight, nil)
highlight('Function', nil, GreenLight, nil)
highlight('Identifier', nil, CyanLight, nil)
highlight('Field', nil, CyanLight, nil)
highlight('Variable', nil, CyanLight, nil)
highlight('Operator', nil, YellowLight, nil)
highlight('Constant', nil, nil, 'bold')
highlight('Conditional', nil, RedLight, nil)
highlight('Function', nil, Green, 'italic')
highlight('Type', nil, GreenBlue, 'bold')
highlight('Repeat', nil, Fuchsia, nil)
highlight('StatusLine', Cyan, JustBlack, nil)
highlight('WildMenu', JustBlack, Grey5, nil)
highlight('Pmenu', JustBlack, Grey5, nil)
highlight('PmenuSel', Black1, nil, nil)
highlight('PmenuThumb', JustBlack, Grey5, nil)
highlight('Search', GreenBlue, White, nil)
highlight('IncSearch', GreenBlue, White, nil)
highlight('DiffAdd', Black3, nil, nil)
highlight('DiffDelete', Black2, nil, nil)
highlight('Normal', JustBlack, Grey5, nil)
highlight('Visual', Black5, nil, nil)
highlight('CursorLine', Black1, nil, nil)
highlight('ColorColumn', Black5, nil, nil)
highlight('SignColumn', JustBlack, nil, nil)
highlight('LineNr', nil, Black4, nil)
highlight('TabLine', JustBlack, Grey3, nil)
highlight('TabLineSel', White, nil, nil)
highlight('TabLineFill', JustBlack, Grey3, nil)
highlight('TSPunctDelimiter', nil, Grey5, nil)

link('TSComment', 'Comment')
link('TSInclude', 'Include')
link('TSRepeat', 'Repeat')
link('TSConditional', 'Conditional')
link('TSVariable', 'Variable')
link('TSLabel', 'Type')
link('TSFuncMacro', 'Macro')
link('TSTagDelimiter', 'Type')
link('Folded', 'Comment')
link('TSKeyword', 'Keyword')
link('TSProperty', 'TSField')
link('NonText', 'Comment')
link('Macro', 'Function')
link('TSString', 'String')
link('TelescopeNormal', 'Normal')
link('TSNamespace', 'TSType')
link('TSParameterReference', 'TSParameter')
link('TSConstant', 'Constant')
link('Whitespace', 'Comment')
link('TSTag', 'MyTag')
link('Repeat', 'Conditional')
link('TSPunctBracket', 'MyTag')
link('TSConstBuiltin', 'TSVariableBuiltin')
link('CursorLineNr', 'Identifier')
link('TSOperator', 'Operator')
link('TSNumber', 'Number')
link('TSParameter', 'Constant')
link('TSPunctSpecial', 'TSPunctDelimiter')
link('TSField', 'Identifier')
link('TSFloat', 'Number')
link('TSFunction', 'Function')
link('TSFuncBuiltin', 'Function')
link('TSFuncCall', 'Function')
link('TSType', 'Type')
