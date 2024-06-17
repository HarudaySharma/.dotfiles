" Leader Key
unmap <Space>

nmap j gj
nmap k gk

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }
exmap surround_dollor surround $ $

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
vunmap s
map s$ :surround_dollor
map s" :surround_double_quotes
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets


" Yank to system clipboard
"set clipboard=unnamed
map <Space>y "+y

" vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

" Obisidian commands
exmap reload obcommand app:reload
exmap TNote obcommand calendar:reveal-active-note
exmap emoji obcommand obsidian-emoji-toolbar:emoji-picker:open-picker
exmap today obcommand daily-notes
exmap left obcommand app:toggle-left-sidebar
exmap right obcommand app:toggle-right-sidebar
exmap stt obcommand app:open-settings
exmap pf obcommand switcher:open
exmap live_grep obcommand omnisearch:show-modal
exmap move_lines_up obcommand editor:swap-line-up
exmap move_lines_down obcommand editor:swap-line-down


" luxury keymaps
map <Space>pf :pf
map <Space>ps :live_grep
map <Space>l :left
map <Space>r :right
map <Space>dn :today
vnoremap J ":move_lines_up V"
vnoremap K ":move_lines_down V"

map $ g$
unmap _
map _ g0
