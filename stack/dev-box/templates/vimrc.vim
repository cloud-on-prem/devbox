set nocompatible           " get rid of Vi compatibility mode. SET FIRST!
set laststatus=2           " last window always has a statusline
set nohlsearch             " Don't continue to highlight searched phrases.
set incsearch              " But do highlight as you type your search.
set ignorecase             " Make searches case-insensitive.
set ruler                  " Always show info along bottom.
set autoindent             " auto-indent
set nowrap                 " don't wrap text
set nu
set ttimeoutlen=10         "wait for 10ms after escape
set hidden                 "Hide the buffers
set tags=.git/tags,tags;$HOME "Where to find ctags
set backspace=indent,eol,start
set autoread
set noswapfile " No swp files
set cursorline             " Highlight the current line
set eol " force blank lines at end of file
set scrolloff=3
set encoding=utf-8
set fileencodings=utf-8
set t_Co=256               " enable 256-color mode.
" set term=screen-256color
let mapleader = ";" "set the leader key to ';' (easy to type)

" Mouse for scrolling etc in console.
set mouse=a

" " Resize split panes with mouse within tmux.
" " Also get live-updated text selection with mouse drag.
" set ttymouse=xterm2

" Deal with Tabs
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-l> redraws the screen and removes any search highlighting.

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" Neobundle
set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
source ~/.config/nvim/.bundle
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
syntax enable
filetype off
filetype plugin indent off
filetype plugin indent on
syntax on

runtime macros/matchit.vim

" Set up syntaxes
let g:syntastic_check_on_open=1
let g:syntastic_shell = "/bin/sh"
let g:syntastic_javascript_checkers = ['jshint', 'jsonlint']
au BufRead,BufNewFile *.rabl set filetype=ruby
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.json set conceallevel=0
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.bundle set filetype=vim
au BufRead,BufNewFile *.fish set filetype=fish
au BufRead,BufNewFile *.tmux.conf set filetype=tmux

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Look and Feel
set background=dark
if filereadable( expand("$HOME/.config/nvim/bundle/vim-colorschemes/colors/gruvbox.vim") )
  " colorscheme gruvbox
  " colorscheme molokai
  colorscheme solarized
  " colorscheme vividchalk
end
hi Normal ctermfg=252 ctermbg=none

" Airline conf
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

if has('gui_running')
  set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ 11
endif

" Disable Arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Burn <Esc>
:imap jj <Esc>
:imap ;; <Esc>


" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprev<CR>
nnoremap <Leader>T <C-W>T<CR> " Move split into a new Tab
nnoremap <Leader>X :tabclose<CR> " Close current Tab

" Coffeescript Support
hi link coffeeReservedError NONE
hi link coffeeSemicolonError NONE
hi link coffeeSpaceError NONE

map <Leader>V :e $MYVIMRC<CR> " Open Vimrc on a whim
nnoremap K i<CR><Esc> " Break lines with ease
nnoremap <Leader>p :set paste!<CR> " Paste stuff like a boss
map <Leader>\ :vsp<CR> " Open a split window on the right
map <Leader>- :sp<CR> " Open a split window bottom
map <Leader>q :q<CR> " Quit a Window
nnoremap <Leader>i ggVG=``

"Run specs like a boss
let g:specType = "rspec"
au FileType ruby call SetUpRubySpecs()

function! SetUpRubySpecs()
  if g:specType == "rspec"
    nnoremap <leader>r :w\|:call VimuxRunCommand("clear && bundle exec rspec --format documentation ". bufname("%") . ":" . line("."))<CR>
  elseif g:specType == "minitest"
    nnoremap <leader>r :w\|:call VimuxRunCommand("clear && ruby -Ilib:test ". bufname("%"))<CR>
  endif
endfunction

" Move to alternate files quickly
nnoremap <leader>. :OpenHorizontal(alternate#FindAlternate())<cr>

"Git Blame
nnoremap <leader>gb :gblame<CR>

"Update Ctags
nnoremap <Leader>ct :!sudo git ctags<CR>

" Search for selected text, forwards or backwards
vnoremap <silent> * :<C-U>
      \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \ gvy/<C-R><C-R>=substitute(
      \ escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \ gV:call setreg('"', old_reg, old_regtype)<CR>
" -------------------------------------------------

command! Spell set spell!
command! Fuckit qa!
command! Refresh so $MYVIMRC

" Common spelling mistakes
command! Qa qa
command! Wq wq
command! W w

" Go Stuff
au FileType go nnoremap <leader>v :GoVet<cr>
au FileType go nnoremap <leader>b :GoBuild<cr>
au FileType go nnoremap <leader>r :w\|:call VimuxRunCommand("clear && go run " . fnamemodify(bufname("%"), ":p"))<CR>
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

"Line Numbers
nnoremap <Leader>nu :set nu!<cr>

"Get rid of annoying white spaces
command! CleanSpaces :%s/\s\+$//

" Ultisnips
let g:UltiSnipsEditSplit = 'vertical'
command! Snip :UltiSnipsEdit
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

nnoremap <Leader>w :set nowrap!<cr>

" ------- Folding
set foldmethod=syntax
set foldlevelstart=100
nnoremap <Space> za
vnoremap <Space> za

"Ag
let g:ag_working_path_mode="r"

" ----------- Unite
if filereadable( expand("$HOME/.vim/bundle/unite.vim/plugin/unite.vim") )
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
endif
nnoremap <C-p> :Unite file file_rec/git file_mru -start-insert -no-split<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <Leader>' :Unite history/yank<cr>
nnoremap <Leader>b :Unite buffer<cr>
let g:neomru#file_mru_limit = 5
" Search
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '--vimgrep --line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
nnoremap <Leader>/ :Unite grep:.<cr>
nnoremap <Leader>t :Unite tag -start-insert -auto-preview<cr>
nnoremap <Leader>l :Unite line -start-insert<cr>
nnoremap <Leader>j :Unite jump<cr>
" Quick Ag Word
nnoremap <Leader>a :UniteWithCursorWord grep:.<cr>
nnoremap <Leader>o :Unite process -start-insert<cr>
" End Unite
"
"Vimfiler
nnoremap <C-n> :VimFiler<cr>
nnoremap <C-f> :VimFilerBufferDir<cr>
let g:vimfiler_as_default_explorer = 1
" Enable file operation commands.
" Edit file by tabedit.
if filereadable( expand("$HOME/.vim/bundle/vimfiler.vim/plugin/vimfiler.vim") )
  call vimfiler#custom#profile('default', 'context', {
      \ 'safe' : 0
      \ })
endif
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = ''
let g:vimfiler_tree_closed_icon = ''
let g:vimfiler_marked_file_icon = ''
let g:vimfiler_tree_indentation = 2

autocmd FileType vimfiler nmap <buffer> c
      \ <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_copy_file)
autocmd FileType vimfiler nmap <buffer> m
      \ <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_move_file)
autocmd FileType vimfiler nmap <buffer> d
      \ <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
autocmd FileType vimfiler nmap <buffer> <TAB>
      \ <Plug>(vimfiler_choose_action)

" Haskell
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell nnoremap <buffer> <Leader>t :GhcModType<CR>
autocmd FileType haskell nnoremap <buffer> <Leader>c :GhcModTypeClear<CR>
autocmd FileType haskell nnoremap <buffer> <Leader>i :GhcModInfo<CR>
autocmd FileType haskell nnoremap <buffer> <Leader>r :VimuxRunCommand(":load " . bufname("%") . "\n")<CR>
autocmd FileType haskell nnoremap <buffer> <Leader>o :VimuxRunCommand("ghc -o /tmp/haskell-play " . bufname("%") . "&& /tmp/haskell-play" . "\n")<CR>

let g:airline#extensions#tmuxline#enabled = 0

"Snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
