"+------------------------------+
" => General
"+------------------------------+
set history=1000 " Sets how many lines of history VIM has to remember

set autoread " Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = ","

set nocompatible " 오리지널 vi와 호환성 제거
set noexrc " Don't use local version of .(g)vimrc, .exerc
set noswapfile	"swp 파일 생성 막기

filetype on " 파일 종류 자동 인식
"filetype plugin on
filetype plugin indent on " 파일 유형 플러그인 사용, 자동 완성 및 들여 쓰기 지원

set mouse=a " 마우스로 스크롤 및 리사이즈 가능 (n: Normal mode / v: Visual mode / i: Insert mode / a: All modes)
set clipboard=unnamed " vim에서 복사한 내용이 클립보드에 저장

"+------------------------------+
" => VIM user interface
"+------------------------------+
" Set 7 lines to the cursor - when moving vertically using j/k
"set so=7

set wildmenu " 자동 완성
set ruler " Always shows current position
set cmdheight=1 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned (종료 후 실행 취소 기억)
set number " 줄번호 표시
set showmode " 모드 변환시 화면에 표시
set showcmd " 입력되는 명령 표시
set showmatch " 대응되는 괄호 짝 보여줌
set matchtime=2 " 0.2초 동안 일치하는 대괄호 표시
set mps+=<:> " 괄호 짝 찾기 기능에 괄호 종류 추

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent " 라인의 시작과 끝의 들여쓰기를 백스페이스로 지움
set whichwrap+=<,>,h,l

set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases (검색어에 대문자 있으면 정확히 일치하는 문자열 찾음)
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers (검색어 입력할 때마다 일치하는 문자열 강조 표시)

set title " 타이틀바에 현재 편집중인 파일 표시
set lazyredraw " Macro 사용 중에 화면을 다시 그리지 않음
"set cursorline " 현재 라인 강조
set laststatus=2 " 상태 라인 항상 표시
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c " Format the status line
"hi statusline ctermfg=Gray ctermbg=4 cterm=none " 윈도우가 2개 이상인 경우 비활성화된 윈도우의 배경색 및 폰트색 설정
"set nostartofline " 커서가 가장 왼쪽으로 이동하지 못하게 함
"set foldcolumn=1 " Add a bit extra margin to the left

"+------------------------------+
" => Colors and Fonts
"+------------------------------+
syntax on " syntax highlighting on
"syntax enable " Enable syntax highlighting

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"try
"   colorscheme dracula
"catch
"endtry

set background=dark

"set fileencoding=utf8,euc-kr
"set fencs=ucs-bom,utf-8,euc-kr

"+------------------------------+
" => Files, backups and undo
"+------------------------------+
" Turn backup off, since most stuff is in SVN, git etc. anyway...
"set noback up
"set nowb
"set noswapfile

"+------------------------------+
" => Text, tab and indent related
"+------------------------------+
"set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs

"set shiftwidth=4 " 1 tab == 4 spaces
"set tabstop=4 " 탭으로 들여쓰기 시 사용할 스페이스 바 개수
set softtabstop=4 " 스페이스 바 n개를 하나의 탭으로 처리

set lbr " Linebreak on 500 characters
set tw=500

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines (자동 줄바꿈)
set cindent " C스타일의 들여쓰기


"+------------------------------+
" => Spell checking
"+------------------------------+

"+------------------------------+
" => key mapping
"+------------------------------+

"+------------------------------+
" => functions
"+------------------------------+
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"+------------------------------+
" => Plugin
"+------------------------------+
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'dracula/vim', { 'name': 'dracula' }
"    Plugin 'scrooloose/nerdtree' " 파일탐색기
"    스니펫
"    Plugin 'honza/vim-snippets'
"    Plugin 'garbas/vim-snipmate'
"    Plugin 'tomtom/tlib_vim' 
"    Plugin 'MarcWeber/vim-addon-mw-utils'
"    Plugin 'http://github.com/tpope/vim-fugitive'
"    
"    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf
"    Plugin 'tpope/vim-fugitive' " Git
call vundle#end()
colorscheme dracula

"call plug#begin('~/.vim/plugged')
"    Plug 'pbondoer/vim-42header'
"call plug#end()

"let g:hdr42user = ''
"let g:hdr42mail = '@student.42seoul.kr'
