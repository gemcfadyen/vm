cookbook_file Helper.home('.gitconfig') do
  owner Helper.user
  group Helper.group
end
