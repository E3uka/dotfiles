# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# export display variable.
# set -Ux DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

# replace fzf with ripgrep.
set -Ux FZF_DEFAULT_COMMAND 'rg --files --hidden --follow -g "!.git/"'

# use latest version of node upon entry.
# nvm use --lts --silent --no-use
