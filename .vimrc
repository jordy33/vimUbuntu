" Jorge Macias vim configuration
" for python 3
"
filetype plugin indent on
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Set bell error off
set noeb vb t_vb=

" Better copy & paste                                                           
" When you want to paste large blocks of code into vim, press F2 before you     
" paste. At the bottom you should see ``-- INSERT (paste) --``.                 
                                                                                
set pastetoggle=<F2>                                                            
set clipboard=unnamed                                                           
                                                                                
                                                                                
" Mouse and backspace                                                           
set mouse=a  " on OSX press ALT and click                                       
set bs=2     " make backspace behave like normal again     

" easier moving between tabs                                                    
map <Leader>n <esc>:tabprevious<CR>                                             
map <Leader>m <esc>:tabnext<CR>                                                 
                                                                                
" map sort function to a key                                                    
vnoremap <Leader>s :sort<CR>                                                    
                                                                                
" easier moving of code blocks                                                  
" Try to go into visual mode (v), thenselect several lines of code here and     
" then press ``>`` several times.                                               
vnoremap < <gv  " better indentation                                            
vnoremap > >gv  " better indentation                                            
                                                                                
" Show whitespace                                                               
" MUST be inserted BEFORE the colorscheme command                               
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red           
"au InsertLeave * match ExtraWhitespace /\s\+$/                                  

" Color scheme                                                                  
" mkdir -p ~/.vim/colors && cd ~/.vim/colors                                    
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=
" check on http://bytefluent.com/vivify/
" set t_Co=256                                                                    
"color wombat256mod                                                              
colorscheme molokai_modified
" showing line numbers and length                                               
set number  " show line numbers                                                 
set tw=79   " width of document (used by gd)                                    
set nowrap  " don't automatically wrap on load                                  
set fo-=t   " don't automatically wrap text when typing                         
set colorcolumn=180                                                              
highlight ColorColumn ctermbg=233       

" easier formatting of paragraphs                                               
vmap Q gq                                                                       
nmap Q gqap                                                                     
                                                                                
" Useful settings                                                               
set history=700                                                                 
set undolevels=700                                                              
                                                                                
" Real programmers don't use TABs but spaces                                   
" set tabstop=4                                                                   
set tabstop=4                                                                   
set softtabstop=4                                                               
set shiftwidth=4                                                                
set shiftround                                                                  
set expandtab                                                                   
                                                                                
                                                                                
" Make search case insensitive                                                  
set hlsearch                                                                    
set incsearch                                                                   
set ignorecase                                                                  
set smartcase                       

" Disable stupid backup and swap files - they trigger too many events           
" for file system watchers                                                      
set nobackup                                                                    
set nowritebackup                                                               
set noswapfile              
                                                    
" Coment lines Shift+v  #
" Uncomment lines Shift+v -#                                                        
vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

" =============
" Python IDE
" =============

" Settings for syntastic
" First: install pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" Second: install syntastic
" cd ~/.vim/bundle 
" git clone https://github.com/scrooloose/syntastic.git
" Third: install pylint
" debian: apt-get-install pylint
" archlinux: pacman -S pylint
set nocp
source ~/.vim/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
syntax on

let g:syntastic_python_checkers = ['python']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_exec= '/usr/bin/pylint'
let g:syntastic_python_python_exec ='/usr/bin/python'
let g:syntastic_check_on_open=1
let g:syntastic_enable_python_checker = 1
" Enable syntax highlighting                                                    
" You need to reload this file for the change to apply                          
filetype off                                                                    
filetype plugin indent on                                                       
syntax on       

"Settings for ctrlp                                                            
" cd ~/.vim/bundle                                                              
" git clone https://github.com/kien/ctrlp.vim.git                               
let g:ctrlp_max_height = 30                                                     
set wildignore+=*.pyc 
set wildignore+=*_build/*                                                       
set wildignore+=*/coverage/* 

" Settings for jedi-vim                                                         
" cd ~/.vim/bundle                                                              
" cd ~/.vim/bundle/ && git clone --recursive https://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"                                         
let g:jedi#popup_on_dot = 0                                                     
let g:jedi#popup_select_first = 0                                               
let g:jedi#popup_on_dot = 0
let g:jedi#force_py_version = 3   
let g:jedi#auto_close_doc = 1
let g:jedi#show_call_signatures = 0

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>     
autocmd FileType python setlocal completeopt-=preview

" Settings for vim air
" https://github.com/bling/vim-airline
" cd ~/.vim/bundle
" git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
set laststatus=2

"Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
hi Comment ctermfg=DarkGray
