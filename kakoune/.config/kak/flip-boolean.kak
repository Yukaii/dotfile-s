define-command -hidden flip-boolean %{
  try %{
    execute-keys '<a-i>w'
    evaluate-commands %sh{
      word=${kak_selection}
      if [ "$word" = "true" ]; then
        printf "execute-keys c%s<esc>blh" "false"
      elif [ "$word" = "false" ]; then
        printf "execute-keys c%s<esc>blh" "true"
      else
        exit 1
      fi
    }
  }
}

define-command -hidden setup-return-mapping %{
  # Check if the filetype matches json, javascript, typescript, or toml
  evaluate-commands %sh{
    case "$kak_opt_filetype" in
      json|javascript|typescript|toml|terraform)
        echo "unmap buffer normal <ret>"
        echo "map buffer normal <ret> ':flip-boolean<ret>'"
        ;;
    esac
  }
}


hook global WinSetOption filetype=.* %{
  setup-return-mapping
}

