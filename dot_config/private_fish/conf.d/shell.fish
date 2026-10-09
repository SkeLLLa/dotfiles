set -g fish_greeting
set -gx EDITOR micro
set -gx CHEAT_USE_FZF true

# Fall back only when the terminal's own terminfo is missing (e.g. over ssh).
if status is-interactive; and not infocmp $TERM &>/dev/null
    set -gx TERM xterm-256color
end

# History lives in save_history (the session name picks the file).
set -g fish_history save

if fish_is_root_user
    set -g fish_color_cwd red
else
    set -g fish_color_cwd green
end

type -q eza; and alias ls="eza --icons=auto -g"
type -q duf; and alias df="duf"
