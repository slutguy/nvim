map zl :set splitright<CR>:vsplit<CR>
map zh :set nosplitright<CR>:vsplit<CR>
map zk :set nosplitbelow<CR>:split<CR>
map zj :set splitbelow<CR>:split<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map ne :tabe<CR>
map eh :-tabnext<CR>
map el :+tabnext<CR>

map mt :edit ~/Documents/2B2T/T-markdown/master.md<CR>
" ==================== Settings ===========================
map zm :set spell!<CR>
set number
set relativenumber
set cursorline
set showcmd
set scrolloff=5
set foldmethod=indent
let &t_ut=''
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
vnoremap Y "+y
"autocmd BufWrite * mkview
"autocmd BufWinLeave * mkview
"autocmd BufRead * silent loadview
" ==================== Install Plugins with Vim-Plug ====================
call plug#begin('$HOME/.config/nvim/plugged')

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'preservim/nerdtree'

" vimwiki
Plug 'vimwiki/vimwiki'

" vimtex
Plug 'lervag/vimtex'

" Plug show 

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" vim-indent-guides
Plug 'preservim/vim-indent-guides'

" color 
Plug 'altercation/vim-colors-solarized'
Plug 'connorholyday/vim-snazzy'
Plug 'nordtheme/vim'
Plug 'vim-airline/vim-airline'

" tabline
Plug 'mkitt/tabline.vim'


" Coc

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set re=0
"===================== Coc ==========================
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-vimlsp', 'coc-highlight', 'coc-tsserver', 'coc-phpls' ]

autocmd CursorHold * silent call CocActionAsync('highlight')
set shortmess+=c
set signcolumn=number
set updatetime=100
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction




"===================== NERDTree =====================
map tt :NERDTreeToggle<CR>


"===================== vimwiki ======================
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" ==================== vim-markdown-toc ====================
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'



" ==================== colors =======================
 syntax enable
 colorscheme nord
" let g:solarized_termcolors=256
 hi Normal guibg=NONE ctermbg=NONE

"===================== vimtex =======================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0


let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'
autocmd Filetype tex setl updatetime=3
"====================== indent-guides ================
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

