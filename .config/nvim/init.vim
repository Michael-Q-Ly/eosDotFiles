" Lines
:set number
:set relativenumber
:set autoindent
:set tabstop=8
:set shiftwidth=8
:set smarttab
:set softtabstop=8
:set mouse=a
:set wildignorecase     " ignorecase in command-line mode
:set modifiable		" To use visual modifications

" Uncomment plugins below and run :PlugInstall after installing VimPlug
" call plug#begin('~/.config/nvim/plugged')

" Aesthetics
Plug 'https://github.com/vim-airline/vim-airline'                       " Status Bar
Plug 'https://github.com/vim-airline/vim-airline-themes'                " Status Bar Themes
Plug 'https://github.com/powerline/powerline'                           " Powerline
Plug 'https://github.com/powerline/fonts'                               " Powerline Fonts
Plug 'https://github.com/preservim/nerdtree'                            " Nerd Tree
Plug 'https://github.com/ryanoasis/vim-devicons'                        " Developer Icons
Plug 'https://github.com/AlphaTechnolog/pywal.nvim.git'			" Python-pywal.nvim

" FuzzyFinders
Plug 'nvim-lua/plenary.nvim'						" Dependency for below
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }		" Telescope.nvim
" or                                , { 'branch': '0.1.x' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }			" Fuzzy Finder!
Plug 'junegunn/fzf.vim'

" Clean Development
Plug 'https://github.com/airblade/vim-gitgutter'                        " Git Gutter
Plug 'https://github.com/tpope/vim-fugitive'                            " FuGitive
Plug 'https://github.com/jiangmiao/auto-pairs'                          " Auto pairs
Plug 'https://github.com/frazrepo/vim-rainbow'                          " Rainbow brackets
Plug 'https://github.com/tpope/vim-commentary'                          " For Commenting gcc & gc
Plug 'http://github.com/tpope/vim-surround'                             " Surrounding ysw
Plug 'https://github.com/junegunn/vim-easy-align'                       " Easy alignment! vipga
Plug 'https://github.com/terryma/vim-multiple-cursors'                  " CTRL + N for multiple cursors
Plug 'https://github.com/tc50cal/vim-terminal'                          " Vim Terminal
Plug 'https://github.com/preservim/tagbar'                              " Tagbar for code navigation

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown Preview

Plug 'https://github.com/neoclide/coc.nvim'                             " CoC Autocompletion
Plug 'https://github.com/dense-analysis/ale'                            " ALE

Plug 'https://github.com/tpope/vim-dispatch.git'			" Neomake

" C/C++ Development
Plug 'vim-scripts/c.vim'                                                " C plugin
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim'                " DoxygenToolkit
Plug 'https://github.com/bfrg/vim-cpp-modern'                           " Cpp Modern
Plug 'https://github.com/tpope/vim-dispatch.git'			" :Make instead of make for async make
Plug 'https://github.com/cpiger/NeoDebug'                               " :NeoDebug Vim Frontend Debug
Plug 'https://github.com/meck/ale-platformio'				" ALE Platformio
Plug 'https://github.com/normen/vim-pio'				" Vim-Platformio

set encoding=UTF-8
call plug#end()

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-ccls
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE
" cd plugged/coc.nvim \ sudo npm install -g yarn \      yarn install \ yarn build
" cd ~/.config/coc/extensions/node_modules/coc-ccls/    \ npm i         \ npm run build
" ln -s node_modules/ws/lib lib                                         " If CCLS fails to load, you likely need to link

" Uncomment what you need from here on

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"

nmap <F8> :TagbarToggle<CR>		" Requires CTags package

" ALE
let g:ale_linters={'cpp': ['ccls']}
let g:ale_fixers={'cpp': ['ccls-format']}
" air-line
let g:ale_display_lsp=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='deus'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
        let g:airline_symbols={}
endif

" NERDTree
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='~'

" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
"
"DoxygenToolkit
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="------------------------------------------------------------------------------------"

" ==================== COCVIM ====================
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
  " nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  " nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  " inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  " inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  " vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  " vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Load all plugins now. (if using packer.nvim)
" Plugins need to be added to runtimepath before helptags can be generated.
" packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
