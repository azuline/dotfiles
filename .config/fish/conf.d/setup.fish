set -g GTK_IM_MODULE ibus
set -g XMODIFIERS @im-bus
set -g QT_IM_MODULE ibus
ibus-daemon -drx

set -g TERM xterm-256color

set -gx GPG_TTY (tty)
set -g EDITOR nvim

# opam configuration
# test -r /home/azul/.opam/opam-init/init.sh && . /home/azul/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

set -g npm_config_prefix "$HOME/.node_modules"
set -g GEM_HOME "$HOME/.gems"
set -g TEXMFHOME "$HOME/.texmf"
source "$HOME/.cargo/env"

set -g PATH "$PATH:$HOME/.poetry/bin"
set -g PATH "$PATH:$HOME/.local/bin"
set -g PATH "$PATH:$HOME/.node_modules/bin"
set -g PATH "$PATH:$HOME/.cargo/bin"
set -g PATH "$PATH:$HOME/.gems/bin"
set -g PATH "$PATH:$HOME/.pyenv/bin"
set -g PATH "$PATH:$HOME/.cabal/bin"
set -g PATH "$PATH:$HOME/.gem/ruby/2.7.0/bin"
set -g PATH "$PATH:$HOME/.yarn/bin"
set -g PATH "$PATH:$HOME/.config/yarn/global/node_modules/.bin"
set -g PATH "$PATH:$HOME/.git-fuzzy/bin"

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# . $HOME/.nix-profile/etc/profile.d/nix.sh

# GO configuration.
set -g GOENV_ROOT "$HOME/.goenv"
set -g PATH "$GOENV_ROOT/bin:$PATH"
source (goenv init - | psub)
set -g PATH "$GOROOT/bin:$PATH"
set -g PATH "$PATH:$GOPATH/bin"

