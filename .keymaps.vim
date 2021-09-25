" Set space to leader
nmap <SPACE> <Nop>
let mapleader=" "

" Set jj to escape
imap <silent> jj <ESC>

" Go to Terminal Normal mode
tnoremap <A-j> <C-\><C-n>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>qq :q!<CR>
nnoremap <Leader>wq :wq<CR>

nnoremap <Leader>awq :wqa<CR>
nnoremap <Leader>aqq :qa!<CR>

" Clear highlight
nnoremap <Leader>nn :noh<CR>

" Tab
nmap tn :tabnew<CR>
nmap th :tabfirst<CR>
nmap tk :tabnext<CR>
nmap tj :tabprev<CR>
nmap tl :tablast<CR>
nmap tt :tabedit<Space>
nmap tm :tabm<Space>
nmap td :tabclose<CR>

" Ignore wrap
nmap j gj
nmap k gk
nmap <Down> gj
nmap <Up> gk
