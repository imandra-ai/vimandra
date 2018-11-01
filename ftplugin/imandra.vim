au filetype imandra   :set softtabstop=2
au filetype imandra   :set shiftwidth=2 " Number of spaces to use for each step of (auto)indent.
au filetype imandra   :setlocal comments=sr:(*,m1:\ ,e:*)

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin=1

function! ImandraMerlinInit ()
  call merlin#Packages('imandra-prelude')
  call merlin#Flags('-open', 'Imandra_prelude')
  call merlin#Register()
  :MerlinFlags -reader imandra
endfunction

function! imandra#MerlinHandle(buffer, lines) abort
    return merlin#ErrorLocList()
endfunction

function! ImandraAleInstall()
call ale#linter#Define('imandra', {
\   'name': 'imandra',
\   'executable': 'ocamlmerlin',
\   'command': 'true',
\   'callback': 'imandra#MerlinHandle',
\})
endfunction

if exists("g:merlin") && !exists("g:imandra_merlin_loaded")
  try
    let g:imandra_merlin_loaded = 1
    echo "ftplugin for imandra: load merlin"
    call ImandraMerlinInit()
    echo "ftplugin for imandra: merlin loaded"
    call ImandraAleInstall()
  catch
    echo "couldn't load merlin properly"
  endtry
endif

au filetype imandra :nmap <leader>i :MerlinDocument<CR>
