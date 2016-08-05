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
if [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; then
  symlink_ssh_auth_sock
else
  for config_file in $FILES
  do
    source $config_file
  done
  export_ssh_auth_sock
fi
