"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Env set
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=a                 " middle-click paste with mouse
set hlsearch                " highlight search results
set incsearch               " Incremental search
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set wildmode=longest,list   " get bash-like tab completions
set cc=80,100                   " set an 80 column border for good coding style
set shell=/bin/zsh
set wrap linebreak nolist
set autoread                " Set to auto read when a file is changed from the outside
set viminfo^=%              " Remember info about open buffers on close
set number relativenumber   " Hybrid relative numbering
set previewheight=10

" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |   exe \"normal! g`\"" | endif

" change python shiftwidth
" autocmd FileType python setlocal noexpandtab shiftwidth=2 softtabstop=2


" color scheme
colorscheme mtcs

" system slipboard as defaut
set clipboard=unnamedplus
" For NeoVim
" let g:clipboard = {
"   \   'copy': {'+': 'xclip -selection clipboard', '*': 'xclip -selection clipboard', },
"   \   'paste': { '+': 'xclip -selection clipboard -o', '*': 'xclip -selection clipboard -o', },
"   \   'cache_enabled': 1,
"   \ }

" nmap <Leader>Pc <Plug>UnconditionalPa" steCharBefore
" nmap <Leader>pc <Plug>UnconditionalPasteCharAfter
" nmap <Leader>Pj <Plug>UnconditionalPasteJustJoinedBefore
" nmap <Leader>pj <Plug>UnconditionalPasteJustJoinedAfter
" nmap <Leader>Pb <Plug>UnconditionalPasteBlockBefore
" nmap <Leader>pb <Plug>UnconditionalPasteBlockAfter
" nmap <Leader>Pi <Plug>UnconditionalPasteIndentedBefore
" nmap <Leader>pi <Plug>UnconditionalPasteIndentedAfter
" nmap <Leader>P> <Plug>UnconditionalPasteShiftedBefore
" nmap <Leader>p> <Plug>UnconditionalPasteShiftedAfter
" nmap <Leader>P# <Plug>UnconditionalPasteCommentedBefore
" nmap <Leader>p# <Plug>UnconditionalPasteCommentedAfter

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set the runtime path to include Plugins manager toinitialize
call plug#begin('~/.vim/plugged')

" Dependencies
"Plug 'xolox/vim-misc'               " xolox/vim-session
"Plug 'vim-scripts/ingo-library'     " UnconditionalPaste
"Plug 'vim-scripts/AlignFromCursor'  " UnconditionalPaste
Plug 'honza/vim-snippets'            " Ultisnipets
Plug 'tpope/vim-speeddating'         , { 'for': 'org'    } " Orgmode

" Interface
"Plug 'kien/ctrlp.vim'               , { 'on': 'CtrlP'          } " Omni find (<C-P>)
"Plug 'radenling/vim-dispatch-neovim', { 'on': ['Dispatch', 'Make', 'Make!']} " Neovim dispatch plugin
Plug 'scrooloose/nerdtree'           , { 'on': 'NERDTreeToggle' } " Directory tree widget (e)
Plug 'Xuyuanp/nerdtree-git-plugin'   , { 'on': 'NERDTreeToggle' } " Git integration for NT
Plug 'majutsushi/tagbar'             , { 'on': 'TagbarToggle'   } " Code tag menu (t)
Plug 'vim-scripts/AnsiEsc.vim'       , { 'on': 'AnsiEsc'        } " Ansi Colors (:AnsiEsc)
Plug 'tpope/vim-dispatch'            , { 'on': ['Gpush', 'Dispatch', 'Make', 'Make!']}          " Ascync execution
Plug 'xuhdev/vim-latex-live-preview' , { 'for': 'tex', 'on': 'LLPStartPreview' }                " Live tex rendering
Plug 'tpope/vim-fugitive'            , { 'on': ['Gstatus', 'Gcommit', 'Gpush', 'Gdiff', 'GV'] } " Git Integration (:Gstatus :Gcommit)
Plug 'junegunn/gv.vim'               , { 'on': 'GV'}                                            " Git View  (:GV)
Plug 'w0rp/ale'                      " Lint engine (:ALEToggle)
Plug 'airblade/vim-gitgutter'        " Git line gutter integration
Plug 'haya14busa/incsearch.vim'      " Better incremental search

" Looks (come last)
Plug 'bling/vim-airline'                        " Status line
Plug 'ryanoasis/vim-devicons'                   " Nice icons on vim
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Colors for dev-icons on nerdtree (may cause lag)
Plug 'bling/vim-bufferline'                     " Buffer status line (down bellow airline)
Plug 'mhinz/vim-startify'                       " Start page for vim
Plug 'ap/vim-css-color'                         " Transform #023456 into a color!
Plug 'nathanaelkane/vim-indent-guides'          " Background lines that show indentation 
" Plug 'chrisbra/Colorizer'

" Editing
" Plug 'vim-scripts/UnconditionalPaste' 
Plug 'vim-scripts/DoxygenToolkit.vim' , { 'for': ['c++', 'c'], 'on': 'Dox' }              " Doc snippets (:Dox)
Plug 'ntpeters/vim-better-whitespace' , { 'on' : ['ToggleWhitespace', 'StripWhitespace']} " Trailing white space detection (ToggleWhitespace)
Plug 'maksimr/vim-translator'         , { 'on' : 'Translate'               }              " Translate Text
Plug 'godlygeek/tabular'            " Table formatter (:Tab/#)
Plug 'tpope/vim-surround'           " Pair char editor (ysiw#) 
Plug 'raimondi/delimitmate'         " Pair char inserter
Plug 'scrooloose/nerdcommenter'     " Comment editor ([L]cc)
Plug 'terryma/vim-multiple-cursors' " Multiple cursors editting
Plug 'idanarye/vim-casetrate'       " Switch between case stiles (camelcase, snakecase stc
Plug 'tpope/vim-repeat'             " Repeat (.) support for other plugins
Plug 'rhysd/vim-grammarous'         " Gramatic correction of text
"Plug 'FredKSchott/CoVim'           " Colaborative vim editting (shame it only works on python2 vim)

" Sessions
"Plug 'tpope/vim-obsession'     " Session Manager
"Plug 'xolox/vim-session'       " Session Manager
Plug 'thaerkh/vim-workspace'    " Session Manager
Plug 'farmergreg/vim-lastplace' " Even without session, opens file in tha last place

" Programming
Plug 'Valloric/YouCompleteMe'       ,{ 'do': './install.py --clang-completer',} " Syntatic completion
"Plug 'dansomething/vim-eclim'      ,{ 'for': ['java', 'scala'] } " Completion for java
Plug 'alfredodeza/pytest.vim'       , { 'on' : 'Pytest'} " Pytest integration
Plug 'idanarye/vim-vebugger'        , { 'on' : ['VBGstartGDB', 'VBGstartPDB', 'VBGattachGDB']} " Debugger integrations
Plug 'apalmer1377/factorus'         " Refactorinc for python, C++ and Java 
" Plug 'joonty/vdebug'              " Another debugger integrations
Plug 'sirver/ultisnips'             " Snippet support 
Plug 'mileszs/ack.vim'              " Find text on current local FS tree
Plug 'alfredodeza/coveragepy.vim'   " Highlight liens that are not covered by tests
Plug 'fs111/pydoc.vim'              " Show python docummentation with S-k

" Language Support
Plug 'sheerun/vim-polyglot'           " 144 language packages, optimized to not impact startup                 
Plug 'JuliaEditorSupport/julia-vim'   , { 'for': 'julia'  }
Plug 'puppetlabs/puppet-syntax-vim'   , { 'for': 'puppet' }
Plug 'derekwyatt/vim-scala'           , { 'for': 'scala'  }
Plug 'vim-latex/vim-latex'            , { 'for': 'latex'  }
Plug 'jceb/vim-orgmode'               , { 'for': 'org'    }
Plug 'mechatroner/rainbow_csv'        " CSV coloring and search
Plug 'szymonmaszke/vimpyter'
"Plug 'jalvesaq/Nvim-R'                

" Profiling vim
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

" " All of your Plugins must be added before the following line
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sessions
let g:workspace_session_name = '.Session.vim'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_default_to_last = 0
"let g:session_default_to_last = 1

" Powerline
let g:Powerline_symbols = 'fancy'
set showtabline=1
" Airline
let g:powerline_pycmd='py3'
let g:airline#extensions#tabline#enabled = 1
" set guifont=DejaVu_Sans_Mono_Book\ 11
set guifont=Ubuntu_Mono_Regular\ 13
let g:airline_powerline_fonts = 1


" NERDTree
let NERDTreeShowBookmarks = 1
let NERDTreeMouseMode = 3
let NERDTreeAutoCenter=0
let NERDTreeIgnore=['.d$[[file]]', '.o$[[file]]', '.bbl$[[file]]', '.toc$[[file]]', '.aux$[[file]]', '.blg$[[file]]', '.tps$[[file]]', '.tcp$[[file]]']
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") && (g:TagmaBufMgrloaded == 1) && b:NERDTreeType == "primary") | qa | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | qa | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Nerd tree dv-icons color plugin
" let g:NERDTreeHighlightFolders = 1

" You Complete Me
let g:ycm_warning_symbol = '!!'
"let g:ycm_global_ycm_extra_conf = ''
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_max_num_candidates = 50
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_auto_trigger = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_detailed_diagnostics = '<leader>yd'
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview
"let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = 'python3'
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" ALE
"let b:ale_linters = {'scala': ['scalac']}
"g:ale_scalastyle_config_loc = '/home/mtcs/.config/scalastyle'
let g:ale_python_flake8_use_global = 0
"let g:ale_python_flake8_executable = '/usr/bin/python3'
"let g:ale_python_flake8_executable = 'python3'
"let g:ale_python_pylint_executable = 'python3'
"let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_flake8_options = '--ignore E501,E203'
let g:ale_python_pylint_options = '--disable=redefined-outer-name' " '--disable=bad-whitespace'
let g:ale_sign_error = "\u2718"
let g:ale_sign_warning = "\u2755"
let g:ale_echo_cursor = 1
let b:ale_fixers = {'python': ['isort']}
"let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_linters = {'python': ['flake8']}

" Pydoc
let g:pydoc_cmd = 'python -m pydoc'
let g:pydoc_window_lines = 0.4

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
"let g:ultisnips_python_style = "google"

" Doxygen Plugin
autocmd Filetype c,cpp set comments^=:///
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
"let g:DoxygenToolkit_paramTag_pre="@param "
"let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_authorName = "Matheus C. Santos"

" Orgmode
let g:org_agenda_files=['~/org/index.org']
let g:org_todo_keywords=['TODO', 'ACTIVE', 'DONE', 'BLOCKED', '|']
" let g:org_heading_highlight_colors = ['Title', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type', 'Special']
let g:org_heading_highlight_colors = ['Title', 'Special', 'Identifier', 'Statement', 'PreProc', 'Type', 'Special']
let g:org_todo_keyword_faces = [['TODO', 'yellow'],['ACTIVE', 'blue'],['DONE', 'green']]

" Nerd Commenter
let g:NERDSpaceDelims = 1

" Arduino
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

" Latex live preview
let g:livepreview_previewer = 'evince'
"let g:livepreview_engine = 'pdflatex' . ' '

" Vim-Markdown
let g:vim_markdown_folding_disabled = 1

" Identation Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0

" Case converter
let g:casetrate_leader = '\k'

" Rainbow csv
let g:rcsv_colorpairs = [['red', 'red'], ['blue', 'blue'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['darkblue', 'darkblue'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta'], ['darkcyan', 'darkcyan']]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
" let maplocalleader = ","

" TagBar and nerdtree
nmap t :TagbarToggle<CR>
nmap e :NERDTreeToggle<CR> :wincmd l<CR>

" Workspace 
nnoremap <leader>ws :ToggleWorkspace<CR>

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>

" Pytest
nmap   <silent><Leader>tf   <Esc>:Pytest   file<CR>
nmap   <silent><Leader>tc   <Esc>:Pytest   class<CR>
nmap   <silent><Leader>tm   <Esc>:Pytest   method<CR>

" Linewise up/down
imap   <silent>   <Down>   <C-o>gj
imap   <silent>   <Up>     <C-o>gk
nmap   <silent>   <Down>   gj
nmap   <silent>   <Up>     gk
map    <silent>   <home>   g<home>
imap   <silent>   <home>   <C-o>g<home>
map    <silent>   <End>    g<End>
imap   <silent>   <End>    <C-o>g<End>

" Window split keys
nnoremap   <silent>   <S-Up>      :wincmd   k<CR>
nnoremap   <silent>   <S-Down>    :wincmd   j<CR>
nnoremap   <silent>   <S-Left>    :wincmd   h<CR>
nnoremap   <silent>   <S-Right>   :wincmd   l<CR>

" Clear search
map <silent> <C-l> :let @/ = ""<CR>

" Compilation
"nnoremap <F5> :SyntasticCheck<CR>
nnoremap <F6> :Errors<CR>
"nnoremap <F9> :ConqueTermTab make<CR>
"nnoremap <F9> :VimShellTab<CR>
"vnoremap <F10> :VimShellSendString<CR>
nnoremap <F11> :make<CR>
nnoremap <F12> :make run<CR>
"nnoremap <S-F12> :make debug<CR>

" Better Help
" ca help<CR> tab help<CR>
map <silent> <F1> :tab help<CR>

" Useful mappings for managing tabs
map   <silent>   <F2>           :tabnew<CR>
map   <silent>   <C-t>          :tabnew<CR>
map   <silent>   <A-PageUp>     :bp<CR>
map   <silent>   <A-PageDown>   :bn<CR>
map   <silent>   <C-PageUp>     :tabprev<CR>
map   <silent>   <C-PageDown>   :tabnext<CR>
ca   :tN<CR>   :tabnew<CR>
ca   :tn<CR>   :tabnext<CR>
ca   :tx<CR>   :tabnext<CR>
ca   :tp<CR>   :tabprev<CR>
ca   :to<CR>   :tabonly<CR>
ca   :tc<CR>   :tabclose<CR>
ca   :tm<CR>   :tabmove<CR>
ca   :bq<CR>   :bd<CR>
command! Sudowrite w !sudo sh -c 'cat > %'

" CnrlP
"map <silent> <C-P> :CtrlP<CR>

" Spell checking
" Pressing ,ss will toggle and untoggle spell checking
ca :Ss<CR> :setlocal spell!<CR>
" Shortcuts using <leader>
ca :Sn<CR> :]s<CR>
ca :Sp<CR> :[s<CR>
ca :Sa<CR> :zg<CR>
ca :S?<CR> :z=<CR>

" NeoVim Terminal
" tnoremap <Esc> <C-\><C-n>

 " Focus Primary window
autocmd VimEnter * wincmd p
