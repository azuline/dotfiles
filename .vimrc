" Load packages

" I am leaving comments describing each one, for maintenance purposes.

" Conquer of Completion
packadd coc.nvim

" Integration for fzf. A lot of FZF commands are bound to `<Leader>{key}` for
" navigating around the filesystem and whatnot.
packadd fzf
packadd fzf.vim

" Lightweight status bar.
packadd lightline.vim

" Previewing markdown files in browser.
" - :MarkdownPreview | open current markdown file in browser.
packadd markdown-preview.nvim

" NERDTree - Tree explorer.
" Mapped <Leader>t to open NERDTree
" Commands:
" - Open | o/i/s
" - Close | x
" - Create/move/delete | m
packadd nerdtree

" Highlights characters on the same line for `f/F` quick jumping.
packadd quick-scope

" Plugin to make commenting code out easier.
" Commands:
" - gcc | comments out a line
" - gc | comments out lines
" - gcap | comment out a paragraph :O
" - You can also use it as a command, either with a range like
"   :7,17Commentary, or as part of a :global invocation like with
"   :g/pattern/Commentary. That's it.
packadd vim-commentary

" Git wrapper.
packadd vim-fugitive

" Git status left of the line numbers.
packadd vim-gitgutter

" Live preview latex files!
" Commands:
"   - :LLPStartPreview | open current latex file in evince.
packadd vim-latex-live-preview

" CoC indicators in lightline.
packadd vim-lightline-coc

" Work with surrounding parentheses/brackets/quotes/whatever
" Comands:
" - csXY | replace surrounding X with Y
packadd vim-surround

" Language syntax highlighting.
packadd vim-polyglot

" Spell file
set spellfile=~/.vim/spell/en.utf-8.add

" Key mappings

" Builtin Vim stuff
set pastetoggle=<F2>
nnoremap <Leader>p <F2>
" FZF commands
nnoremap <Leader>. :GitFiles! --cached --others --exclude-standard<CR>
nnoremap <Leader>f :Files!<CR>
nnoremap <Leader>g :Rg!<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :Lines!<CR>
nnoremap <Leader>r :History!<CR>
nnoremap <Leader>c :Commands!<CR>
nnoremap <Leader>C :History:!<CR>
nnoremap <Leader>h :BCommits!<CR>
nnoremap <Leader>H :Commits!<CR>
" NERDTree
nnoremap <Leader>t :NERDTreeToggleVCS<CR>
nnoremap <Leader>T :NERDTreeFind<CR>

" Swap files
:set directory=$HOME/.vim/swap/

" Gitgutter
highlight! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    ctermfg=2 ctermbg=NONE
highlight GitGutterChange ctermfg=3 ctermbg=NONE
highlight GitGutterDelete ctermfg=1 ctermbg=NONE

" Markdown Preview
let g:mkdp_browser='firefox'
let g:mkdp_highlight_css='~/.vim/markdown_preview.css'
let g:mkdp_port='7237'

" Latex Live Preview
let g:livepreview_cursorhold_recompile=0

" NERDTree
" Ignore artifacts.
let NERDTreeIgnore = ['build', 'node_modules', '__pycache__', '\.egg-info$', '\.pyc$', '\.o$']
" Show hidden by default.
let NERDTreeShowHidden=1
" Single click mouse in NERDTree.
let NERDTreeMouseMode=3

" Lightline
set laststatus=2
set noshowmode

let g:lightline={
\   'active': {
\     'left': [
\       ['mode', 'paste'],
\       ['readonly', 'filename', 'modified', 'helloworld'],
\       ['coc_status']
\     ],
\     'right': [
\       ['lineinfo'],
\       ['percent'],
\       ['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'],
\       ['fileformat', 'fileencoding', 'filetype'],
\     ]
\   }
\ }
call lightline#coc#register()

" CoC

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Sort Python imports on save.
autocmd BufWritePre *.py :CocCommand python.sortImports
