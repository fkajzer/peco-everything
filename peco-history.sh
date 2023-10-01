peco_select_history() {
  peco_flags="--layout=bottom-up"
  
  # Remove line numbers and potential "* " at the start, then reverse the history
  command=$(history | sed 's/^[ \t]*[0-9]*[ \t]*\(\*\ \)*//g' | tac | peco $peco_flags)

  # Check if the command variable is populated
  if [ -n "$command" ]; then
    # use this if you want to run it immediately
    # eval "$command"
    print -z "$command"
  else
    echo "No command selected."
  fi
}

peco_select_history
