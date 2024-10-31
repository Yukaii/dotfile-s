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

# Hook to manage key mappings based on filetype
hook global WinSetOption filetype=.* %{
    # Always unmap <Return> globally to avoid conflicts
    unmap global normal <ret>

    # Check if the filetype matches json, javascript, or typescript
    evaluate-commands %sh{
        case "$kak_opt_filetype" in
            json|javascript|typescript)
                echo "map global normal <ret> ':flip-boolean<ret>'"
                ;;
        esac
    }
}


