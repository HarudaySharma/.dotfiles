nmap <F9> :nohl
exmap up map j <Up>
map j :up
exmap down map k <Down>
map k :down


exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
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
set clipboard=unnamed

" Obisidian commands
exmap reload obcommand app:reload
exmap TNote obcommand calendar:reveal-active-note
exmap emoji obcommand obsidian-emoji-toolbar:emoji-picker:open-picker
exmap today obcommand daily-notes
exmap left obcommand app:toggle-left-sidebar
exmap right obcommand app:toggle-right-sidebar
exmap stt obcommand app:open-settings


"nmap  :reload


