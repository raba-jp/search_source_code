function __continuous_search_source_code --a code -d "Interactive and continuous source code search"
  function __is_exist_peco
    command type peco >/dev/null 2>&1
    echo $status
  end

  function __is_exist_ag
    command type ag >/dev/null 2>&1
    echo $status
  end

  [ (__is_exist_peco) -ne 0 ]; and echo "Requires 'peco' command."; and return
  [ (__is_exist_ag) -ne 0 ]; and echo "Requires 'ag' command."; and return
  ag code | peco --exec 'awk -F : '"'"'{print "+" $2 " " $1}'"'"' | xargs less '
end
