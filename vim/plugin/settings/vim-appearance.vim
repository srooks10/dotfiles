" from https://github.com/skwp/dotfiles/blob/master/vim/plugin/settings/yadr-appearance.vim
" Make it beautiful - colors and fonts
if has("gui_running")
"tell the term has 256 colors
  set t_Co=256

" http://ethanschoonover.com/solarized/vim-colors-solarized
  colorscheme solarized
  set background=dark

  set lines=60
  set columns=84

  set guifont=Inconsolata\ Medium\ 11
"  set guioptions-=m  "remove menu bar
"  set guioptions-=T  "remove toolbar
"  set guioptions-=r  "remove right-hand scroll bar
else
"dont load csapprox if we no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
endif


