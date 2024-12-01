declare-option str hop_keyset 'qwertyuiopasdfghjklzxcvbnm'  # beakl wi layout

define-command hop-kak %{
  evaluate-commands -no-hooks -- %sh{ hop-kak --keyset "$kak_opt_hop_keyset" --sels "$kak_selections_desc" }
}

define-command hop-kak-sel %{
  execute-keys 'gtGbxs<ret>'
  hop-kak
}

define-command hop-kak-words %{
  execute-keys 'gtGbxs\w+<ret>'
  hop-kak
}

map global jump-actions f ': hop-kak-sel<ret>'   -docstring 'find selection,word (on page)'
map global jump-actions F ': hop-kak-words<ret>' -docstring 'find selection,word (on page)'
