

function! SourceGitVimrc(dir)
  let gitroot = system("cd " . fnameescape(a:dir) . "; git rev-parse --show-toplevel 2>/dev/null")
  " Strip trailing newline and escape
  let gitroot = substitute(gitroot, "\\n*$","","")
  if strlen(gitroot) && filereadable(gitroot . '/.vimrc')
    execute "source " . fnameescape(gitroot) . '/.vimrc'
  endif
endfunction 

autocmd BufRead * call SourceGitVimrc(expand("<afile>:p:h"))

