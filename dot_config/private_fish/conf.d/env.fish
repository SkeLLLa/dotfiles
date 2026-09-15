# Path definitions
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx CARGO_HOME "$HOME/.cargo"
set -gx APPS_BIN "$HOME/bin"

fish_add_path $CARGO_HOME/bin $APPS_BIN $PNPM_HOME $HOME/.local/bin
