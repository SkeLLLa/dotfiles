set -gx VOLTA_FEATURE_PNPM true

# Path definitions
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx CARGO_HOME "$HOME/.cargo"
set -gx APPS_BIN "$HOME/bin"

fish_add_path $VOLTA_HOME/bin $CARGO_HOME/bin $APPS_BIN $QT6_HOME/bin $PNPM_HOME
