# Modified based on https://github.com/hadronized/bookmarks.kak

declare-option str bookmarks_path %sh{echo $HOME/.local/share/bookmarks.kak}
declare-option -hidden int bookmarks_current_line

define-command bookmarks-init %{
  nop %sh{
    mkdir -p ~/.local/share
  }
}

define-command bookmarks-open -params 1 %{
  edit %arg{1}
  try %{
    add-highlighter window/bookmarks ref bookmarks
    map buffer normal <ret> ':bookmarks-jump<ret>'
  }
}

define-command bookmarks-jump %{
  evaluate-commands %{
    set-option buffer bookmarks_current_line %val{cursor_line}
    execute-keys 'xs^((?:\w:)?[^:]+):(\d+):(\d+)?<ret>'
    evaluate-commands -verbatim -- edit -existing %reg{1} %reg{2} %reg{3}
  }
}

define-command bookmarks-add -params 2 %{
  nop %sh{
    echo "$kak_buffile:$kak_cursor_line:$kak_cursor_column:$2" >> $1
  }
}

define-command bookmarks-add-prompt -params 1 %{
  prompt bookmark: %{
    bookmarks-add %arg{1} %val{text}
  }
}

add-highlighter shared/bookmarks group
add-highlighter shared/bookmarks/lines regex "^((?:\w:)?[^:\n]+):(\d+):(\d+)?" 1:cyan 2:green 3:green
add-highlighter shared/bookmarks/current line %{%opt{bookmarks_current_line}} default+b

declare-user-mode bookmarks
map global bookmarks a ':bookmarks-add-prompt %opt{bookmarks_path}<ret>' -docstring 'add a bookmark'
map global bookmarks l     ':bookmarks-open %opt{bookmarks_path}<ret>'      -docstring 'open bookmarks'
