" Set space to leader
nn <SPACE> <Nop>
let mapleader=" "

" Set jj to escape
ino <silent> jj <ESC>

" Go to Terminal Normal mode
tno <A-j> <C-\><C-n>

" Save and close
nn <Leader>w :w<CR>
nn <Leader>qq :q!<CR>
nn <Leader>wq :wq<CR>
nn <Leader>awq :wqa<CR>
nn <Leader>aqq :qa!<CR>

" Clear highlight
nn <Leader>nn :noh<CR>

" Spell
nn <Leader>ss :set spell spelllang=en_us<CR>
nn <Leader>us :set nospell<CR>

" Buffer
nn <silent> <C-j> :bprev<CR>
nn <silent> <C-k> :bnext<CR>

" Tab
nn tn :tabnew<CR>
nn th :tabfirst<CR>
nn tk :tabnext<CR>
nn tj :tabprev<CR>
nn tl :tablast<CR>
nn tt :tabedit<Space>
nn tm :tabm<Space>
nn td :tabclose<CR>

" Ignore wrap
nn j gj
nn k gk
nn <Down> gj
nn <Up> gk
