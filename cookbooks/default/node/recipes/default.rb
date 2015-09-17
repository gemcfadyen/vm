node_package       = "node-v0.12.7-linux-x64"
node_url           = "https://nodejs.org/dist/v0.12.7/#{node_package}.tar.gz"
node_tar           = Helper.home('nodejs.tar.gz')
node_home          = Helper.home('.nodejs')
node_unpacked_path = Helper.home(node_package)
node               = "#{Helper.home('.bin')}/node"
npm                = "#{Helper.home('.bin')}/npm"

remote_file node_tar do
  owner Helper.user
  source node_url
  mode '0644'
end

directory node_home do
  owner Helper.user
  action :delete
  recursive true
end

bash 'unpack nodejs' do
  user Helper.user
  code "tar -xvzf #{node_tar} -C #{Helper.home}"
end

bash 'move nodejs' do
  user Helper.user
  code "mv #{node_unpacked_path} #{node_home}"
end

bash 'link node' do
  user Helper.user
  code "ln -s #{node_home}/bin/node #{node}"
  not_if "test -e #{node}"
end

bash 'link npm' do
  user Helper.user
  code "ln -s #{node_home}/bin/npm #{npm}"
  not_if "test -e #{npm}"
end

file node_tar do
  owner Helper.user
  action :delete
end

cookbook_file Helper.home('.npmrc') do
  owner Helper.user
end

cookbook_file Helper.home('.zsh/node.zsh') do
  owner Helper.user
end
