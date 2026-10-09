# WezTerm shell integration: report cwd via OSC 7.
if set -q WEZTERM_PANE
    function __wezterm_set_cwd --on-variable PWD
        printf "\033]7;file://%s%s\033\\" $hostname (string escape --style=url $PWD)
    end
    __wezterm_set_cwd
end
