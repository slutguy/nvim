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

set number
set relativenumber
set cursorline
set showcmd
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





"===================== vimtex =======================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0


let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'
autocmd Filetype tex setl updatetime=3
