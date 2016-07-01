cookbook_file Helper.home('fancy_prompt.sh') do
  owner Helper.user
  group Helper.group
end

cookbook_file Helper.home('.git-completion.bash') do
  owner Helper.user
  group Helper.group
end

cookbook_file Helper.home('.bashrc') do
  owner Helper.user
  group Helper.group
end

cookbook_file Helper.home('.bash_profile') do
  owner Helper.user
  group Helper.group
end
