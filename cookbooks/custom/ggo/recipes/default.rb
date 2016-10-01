golang_package       = 'go1.6.2'
golang_url           = "https://storage.googleapis.com/golang/#{golang_package}.linux-amd64.tar.gz"
golang_tar           = Helper.home('golang.tar.gz')
golang_home          = Helper.home('.golang')
golang_unpacked_path = Helper.home('go')
go                   = "#{Helper.home('.bin')}/go"
go_project_dir       = Helper.home('/home/vagrant/Documents/GoProjects')

directory go_project_dir do
  owner Helper.user
  group Helper.group
  recursive true
end

remote_file golang_tar do
  owner Helper.user
  source golang_url
  mode '0644'
end

directory golang_home do
  owner Helper.user
  action :delete
  recursive true
end

directory go do
  owner Helper.user
  group Helper.group
  recursive true
end

bash 'unpack golang' do
  user Helper.user
  group Helper.group
  code "tar -xzvf #{golang_tar} -C #{Helper.home}"
end

bash 'move golang' do
  user Helper.user
  group Helper.group
  code "mv #{golang_unpacked_path} #{golang_home}"
end

bash 'link golang' do
  user Helper.user
  group Helper.group
  code "ln -s #{golang_home}/bin/go #{go}"
  not_if "test -e #{go}"
end

file golang_tar do
  owner Helper.user
  action :delete
end

cookbook_file Helper.home('.bashscripts/go.bash') do
  owner Helper.user
  group Helper.group
end
