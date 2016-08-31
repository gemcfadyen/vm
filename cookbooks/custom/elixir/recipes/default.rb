asdf_dir = Helper.home('.asdf')

apt_package 'elixir'

# to install version manager for elixir 'asdf': https://gist.github.com/rubencaro/6a28138a40e629b06470
git asdf_dir do
  user Helper.user
  group Helper.group
  repository 'https://github.com/asdf-vm/asdf.git'
  reference 'v0.1.0'
  action :sync
end

bash 'setup asdf home paths' do
  code <<-EOH
     echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
     echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
  EOH
end
