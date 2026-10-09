# Path definitions
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx CARGO_HOME "$HOME/.cargo"
set -gx APPS_BIN "$HOME/bin"

fish_add_path $CARGO_HOME/bin $APPS_BIN $PNPM_HOME $HOME/.local/bin

# Locale: en_CA text, C formats (mirrors private_plasma-localerc)
set -gx LANG en_CA.UTF-8
set -gx LC_ADDRESS C
set -gx LC_MEASUREMENT C
set -gx LC_MONETARY C
set -gx LC_NAME C
set -gx LC_PAPER C
set -gx LC_TELEPHONE C
set -gx LC_TIME C

# macOS only: mise installs brew: packages (curl, gawk, btop, ...) into /opt/homebrew without Homebrew,
# and macOS doesn't put it on fish's PATH. Append so mise tools keep priority.
if test (uname) = Darwin; and test -d /opt/homebrew/bin
    fish_add_path -a /opt/homebrew/bin /opt/homebrew/sbin
end
