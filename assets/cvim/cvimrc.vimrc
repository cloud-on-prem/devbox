" Settings
set hud
set smoothscroll
set noautofocus
set typelinkhints
let searchlimit = 30
let scrollstep = 70
let barposition = "top"
let locale = "au"
let hintcharacters = "asdfghjkl"
let completionengines = ["google", "amazon", "imdb", "youtube", "wikipedia"]
set completeonopen
command g tabnew google
command a tabnew amazon
command i tabnew imdb
command w tabnew wikipedia
command y tabnew youtube
command h history
command b bookmarks
let mapleader = "<Space>"
" Mappings
map <Leader><Space> :
map <Leader>r reloadTabUncached
map <Leader>x :restore<Space>
