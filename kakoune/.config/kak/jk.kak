# https://discuss.kakoune.com/t/escaping-from-insert-mode-with-jk/2557
declare-option str escape_insert_first "j"
declare-option str escape_insert_second "k"

define-command escape_insert_setup %{
    # Remove any other hooks for the first character.
    remove-hooks window escape-insert-first

    # When we get the first character of the sequence,
    # start looking for the second.
    hook -group escape-insert-first window \
    InsertChar "\Q%opt{escape_insert_first}" %{
        escape_insert_setup_second
    }
}

define-command -hidden escape_insert_setup_second %{
    # If we get another character inserted, let's check it out.
    hook -group escape-insert-second window InsertChar .* %{
        # Remove any other left-over hooks for the second character.
        remove-hooks window escape-insert-second

        evaluate-commands %sh{
            case "$kak_hook_param" in
                "$kak_opt_escape_insert_second")
                    # We did indeed get the second character!
                    echo "execute-keys <backspace><backspace><esc>"
                    echo "escape_insert_setup"
                    ;;
                "$kak_opt_escape_insert_first")
                    # Got the first character,
                    # set up to check for the second again.
                    echo "escape_insert_setup_second"
                    ;;
                *)
                    # Got something else,
                    # go back to checking for the first character.
                    echo "escape_insert_setup"
            esac
        }
    }

    # If we delete a character, that's not the escape sequence.
    hook -group escape-insert-second window InsertDelete .* %{
        # Remove any other left-over hooks for the second character.
        remove-hooks window escape-insert-second

        # Set up to trigger on the first key of the sequence again.
        escape_insert_setup
    }

    # If we move the cursor, that's not the escape sequence.
    hook -group escape-insert-second window InsertMove .* %{
        # Remove any other left-over hooks for the second character.
        remove-hooks window escape-insert-second

        # Set up to trigger on the first key of the sequence again.
        escape_insert_setup
    }

    # If we leave insert mode, that's not the escape sequence.
    hook -group escape-insert-second window ModeChange .* %{
        # Remove any other left-over hooks for the second character.
        remove-hooks window escape-insert-second

        # Set up to trigger on the first key of the sequence again.
        escape_insert_setup
    }
}

hook global WinDisplay .* escape_insert_setup

