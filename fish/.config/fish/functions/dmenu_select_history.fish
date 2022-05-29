function dmenu_select_history
  history|dmenu|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
