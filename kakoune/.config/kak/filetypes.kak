hook global BufCreate .*[.]ejs %{
 set-option buffer filetype embedded-template
 set buffer tree_sitter_lang 'embedded-template'
}

hook global BufCreate .*\.tmux.conf %{
  set-option buffer filetype conf
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

hook global BufCreate .*[.](glsl) %{
 set-option buffer filetype cpp
}

hook global BufCreate .*[.](vue) %{
 set-option buffer filetype vue
}

