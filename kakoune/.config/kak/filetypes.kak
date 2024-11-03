hook global BufCreate .*[.]ejs %{
 set-option buffer filetype embedded-template
 set buffer tree_sitter_lang 'embedded-template'
}

hook global BufOpenFile .* %{
    evaluate-commands %sh{
        # Check if the current buffer file path ends with "ghostty/config"
        if [[ "${kak_buffile}" == *"/ghostty/config" ]]; then
            # Set the buffer filetype to toml
            printf "set-option buffer filetype 'toml'\n"
        fi
    }
}
