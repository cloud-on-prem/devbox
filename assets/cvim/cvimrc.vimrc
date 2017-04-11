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
command h tabnew history
command b tabnew bookmarks
let mapleader = "<Space>"
" Mappings
map h :history<Space>
map b :bookmarks<Space>
map s :buffer<Space>
map <Leader><Space> :
map <Leader>r reloadTabUncached
map <Leader>x :restore<Space>
