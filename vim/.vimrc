syntax on

set diffopt+=vertical 
set nohlsearch
set nopaste
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set smartcase
set noswapfile
set nobackup
"set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber
set nowrap
set t_Co=256
set encoding=utf-8
set guifont=*
set guioptions-=T 
set guioptions-=r 
set go-=L


let g:qs_enable=0
let g:EclimFileTypeValidate = 0
let g:syntastic_java_checkers = []
let g:airline_powerline_fonts = 1
let g:OmniSharp_server_stdio = 1
let g:ycm_auto_hover=''


set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
#Plug 'Valloric/YouCompleteMe'
Plug 'terrortylor/nvim-comment'
Plug 'lewis6991/impatient.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'enricobacis/vim-airline-clock'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'phaazon/hop.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:dashboard_default_executive ='telescope'
let g:suda#prompt = 'Password: '
let g:sneak#label = 1
let g:gitblame_enabled = 0

colorscheme gruvbox
" colorscheme pablo
nmap<leader>gd <plug>(coc-definition)
nmap<leader>gr <Plug>(coc-references)
nnoremap <C-s> :GitFiles<CR>

cnoremap w!! w !sudo tee > /dev/null %
nnoremap <C-t> :FloatermToggle<CR>

"almost like sneak
nnoremap <C-x> :HopWord<CR>

" colorscheme rose-pine
set background=dark


let mapleader = " "
"keybindig to move in windows, undotree, and split
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>/ :lua require("Comment.api").toggle_current_linewise()<CR>
nnoremap <leader>t :ToggleTerm direction=float<cr>


nnoremap <leader>v :wincmd v<bar> :NERDTreeToggle <bar><CR>

"manual resize keybindig
nnoremap <silent><leader>+ :vertical resize +4<CR>
nnoremap <silent><leader>- :vertical resize -4<CR>

"sets ctrl + k to esc (exit insert or visual mode)
inoremap kj <Esc>
vnoremap kj <Esc>


"copy and paste from and to other progams
vnoremap <C-c> "+y
map <C-v> "+P


"vim fugitive
nnoremap <leader>gh :diffget//3<CR>
nnoremap <leader>gl :diffget//2<CR>
nnoremap <leader>gs :G<CR>



"ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap<leader>r :Rg<CR>


"alt for visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

lua <<EOF
require'hop'.setup()
    require('telescope').setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '-L'
        }
    }
}
require("nvim-tree").setup{}

EOF

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>f :Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>sc :Telescope colorscheme<CR>



let g:dashboard_custom_header = [
\"                    .                    ",
\"    ##############..... ##############   ",
\"    ##############......##############   ",
\"      ##########..........##########     ",
\"      ##########........##########       ",
\"      ##########.......##########        ",
\"      ##########.....##########..        ",
\"      ##########....##########.....      ",
\"    ..##########..##########.........    ",
\"  ....##########.#########.............  ",
\"    ..################JJJ............    ",
\"      ################.............      ",
\"      ##############.JJJ.JJJJJJJJJJ      ",
\"      ############...JJ...JJ..JJ  JJ     ",
\"      ##########....JJ...JJ..JJ  JJ      ",
\"      ########......JJJ..JJJ JJJ JJJ     ",
\"      ######    .........                ",
\"                  .....                  ",
\"                    .                    ",
\ ]


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)



