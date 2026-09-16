if test -x "$HOME/.local/bin/mise"
    if not set -q VSCODE_INJECTION
        "$HOME/.local/bin/mise" activate fish | source
    end

    fish_add_path -gp "$HOME/.local/share/mise/shims"
    # fnox bakes its version-pinned install path into the activation script, which
    # breaks every shell once mise prunes that version. Point it at the `latest` symlink.
    fnox activate fish | string replace -ra '/installs/fnox/[0-9][^/]*/fnox' '/installs/fnox/latest/fnox' | source

    # Keep mise's activation behavior, but give ordinary mise commands the
    # exec-only GitHub token from the global fnox configuration.
    function mise
        if test (count $argv) -eq 0
            command "$HOME/.local/bin/mise"
            return
        end

        set command_name $argv[1]
        set -e argv[1]

        if contains -- --help $argv
            command "$HOME/.local/bin/mise" "$command_name" $argv
            return $status
        end

        switch "$command_name"
            case deactivate shell sh
                if contains -- -h $argv
                    command "$HOME/.local/bin/mise" "$command_name" $argv
                else if contains -- --help $argv
                    command "$HOME/.local/bin/mise" "$command_name" $argv
                else
                    source (command "$HOME/.local/bin/mise" "$command_name" $argv | psub)
                end
            case '*'
                command fnox --config "$HOME/.config/fnox/config.toml" exec -- \
                    "$HOME/.local/bin/mise" "$command_name" $argv
        end
    end
end
