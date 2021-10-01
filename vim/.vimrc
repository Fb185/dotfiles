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



let g:airline_powerline_fonts = 1
let g:OmniSharp_server_stdio = 1
let g:ycm_auto_hover=''

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'glepnir/dashboard-nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'Valloric/YouCompleteMe'

call plug#end()
let g:dashboard_default_executive ='telescope'

colorscheme gruvbox
nmap<leader>gd <plug>(coc-definition)
nmap<leader>gr <Plug>(coc-references)
nnoremap <C-f> :GitFiles<CR>

cmap w!! w !sudo tee > /dev/null %

nnoremap <C-t> :FloatermToggle<CR>


set background=dark

let mapleader = " "
"keybindig to move in windows, undotree, and split
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <C-g> :NERDTreeToggle<CR>


"harpoon
nnoremap <C-h> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <C-m> :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-n> :lua require("harpoon.mark").rm_file()<SPACE>
"lua <<EOF
"    require("harpoon").setup({
"        global_settings = {
"            save_on_toggle = false,
"            save_on_change = true,
"        },
"    })
"EOF

"opens explorer 
nnoremap <leader>v :wincmd v<bar> :Ex <bar><CR>

"manual resize keybindig
nnoremap <silent><leader>+ :vertical resize +4<CR>
nnoremap <silent><leader>- :vertical resize -4<CR>

"sets ctrl + k to esc (exit insert or visual mode)
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>


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

"coc
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <silent><expr> <c-space> coc#refresh()


"alt for visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

lua <<EOF
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
EOF

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



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




" Get text in files with Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)



