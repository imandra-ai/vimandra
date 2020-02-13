au filetype imandra   :set softtabstop=2
au filetype imandra   :set shiftwidth=2 " Number of spaces to use for each step of (auto)indent.
au filetype imandra   :setlocal comments=sr:(*,m1:\ ,e:*)

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin=1

au filetype imandra :nmap <leader>i :MerlinDocument<CR>
