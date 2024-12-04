hook -group lsp-filetype-javascript global BufSetOption filetype=(?:javascript|typescript) %{
  set-option buffer lsp_servers %{
    [typescript-language-server]
    root_globs = ["package.json", "tsconfig.json", "jsconfig.json", ".git", ".hg"]
    args = ["--stdio"]
    settings_section = "_"
    [typescript-language-server.settings._]
    # quotePreference = "double"
    # typescript.format.semicolons = "insert"

    [vscode-eslint-language-server]
    root_globs = [".eslintrc", ".eslintrc.json"]
    args = ["--stdio"]
    workaround_eslint = true
    [vscode-eslint-language-server.settings]
    codeActionsOnSave = { mode = "all", "source.fixAll.eslint" = true }
    format = { enable = true }
    quiet = false
    rulesCustomizations = []
    run = "onType"
    validate = "on"
    experimental = {}
    problems = { shortenToSingleLine = false }
    codeAction.disableRuleComment = { enable = true, location = "separateLine" }
    codeAction.showDocumentation = { enable = false }

    [tailwindcss-language-server]
    root_globs = ["tailwind.config.ts", "tailwind.config.js"]
    args = ["--stdio"]
    settings_section = "_"
    [tailwindcss-language-server.settings._]
    editor = {}

    [typos-lsp]
    root_globs = [".git", ".hg"]

    [simple-completion-language-server]
    root_globs = [".git", ".hg"]
    [simple-completion-language-server.settings.scls]
    max_completion_items = 20            # set max completion results len for each group: words, snippets, unicode-input
    snippets_first = true                # completions will return before snippets by default
    snippets_inline_by_word_tail = false # suggest snippets by WORD tail, for example text `xsq|` become `x^2|` when snippet `sq` has body `^2`
    feature_words = true                 # enable completion by word
    feature_snippets = true              # enable snippets
    feature_unicode_input = true         # enable "unicode input"
    feature_paths = true                 # enable path completion
    feature_citations = false            # enable citation completion (only on `citation` feature enabled)

    [simple-completion-language-server.settings.environment]
    RUST_LOG = "info,simple-completion-language-server=info"
    LOG_FILE = "/tmp/completion.log"
  }
}

hook -group lsp-filetype-markdown global BufSetOption filetype=markdown %{
  set-option buffer lsp_servers %{
    [marksman]
    root_globs = [".marksman.toml", ".git", ".obsidian", ".hg"]
    args = ["server"]

    [markdown-oxide]
    root_globs = [".git", ".hg", ".obsidian"]

    [typos-lsp]
    root_globs = [".git", ".hg"]

    [simple-completion-language-server]
    root_globs = [".git", ".hg"]
    [simple-completion-language-server.settings.scls]
    max_completion_items = 20            # set max completion results len for each group: words, snippets, unicode-input
    snippets_first = true                # completions will return before snippets by default
    snippets_inline_by_word_tail = false # suggest snippets by WORD tail, for example text `xsq|` become `x^2|` when snippet `sq` has body `^2`
    feature_words = true                 # enable completion by word
    feature_snippets = true              # enable snippets
    feature_unicode_input = true         # enable "unicode input"
    feature_paths = true                 # enable path completion
    feature_citations = false            # enable citation completion (only on `citation` feature enabled)

    [simple-completion-language-server.settings.environment]
    RUST_LOG = "info,simple-completion-language-server=info"
    LOG_FILE = "/tmp/completion.log"
  }
}

hook -group lsp-filetype-gleam global BufSetOption filetype=(?:gleam) %{
  set-option buffer lsp_servers %{
    [gleam]
    root_globs = ["gleam.toml", "manifest.toml"]
    args = ["lsp"]
  }
}

hook -group lsp-filetype-dockerfile global BufSetOption filetype=(?:dockerfile) %{
  set-option buffer lsp_servers %{
    [docker-langserver]
    root_globs = [".git", ".hg"]
    args = ["--stdio"]
  }
}


hook -group lsp-filetype-vue global BufSetOption filetype=(?:vue) %{
  set-option buffer lsp_servers %{
    [vue-language-server]
    root_globs = [".git", ".hg"]
    args = ["--stdio"]
    settings_section = "_"

    [vue-language-server.settings._]
    typescript = { tsdk = "node_modules/typescript/lib/" }

    [typescript-language-server]
    root_globs = ["package.json", "tsconfig.json", "jsconfig.json", ".git", ".hg"]
    args = ["--stdio"]
    settings_section = "_"

    [[typescript-language-server.settings._.plugins]]
    name = "@vue/typescript-plugin"
    location = "/Users/yukai/.bun/install/global/node_modules/@vue/typescript-plugin"
    languages = ["vue"]
    # quotePreference = "double"
    # typescript.format.semicolons = "insert"
  }
}

