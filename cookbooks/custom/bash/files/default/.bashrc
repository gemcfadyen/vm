source ~/fancy_prompt.sh
source ~/.git-completion.bash

function ssh_key_for() {
  curl -i https://api.github.com/users/${1}/keys
}

function symlink_ssh_auth_sock() {
  ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
}

function export_ssh_auth_sock() {
  export SSH_AUTH_SOCK=/home/vagrant/.ssh/ssh_auth_sock
}

FILES=$HOME/.bashscripts/*.bash
# Load other config files and maintain SSH_AUTH_SOCK
# If we are in tmux, load all the .bash scripts
# Otherwise create symlink
# This is to allow git keys to be forwarded to the vm
if [ -n "$TMUX" ]; then
  for config_file in $FILES
  do
    source $config_file
  done
  export_ssh_auth_sock
else
  symlink_ssh_auth_sock
fi

#Print divider under each command
PROMPT_COMMAND=printDivider
function printDivider() {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -;
  }
