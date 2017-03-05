ngrok_url           ="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip"
ngrok_tar           = Helper.home('ngrok.tar.gz')
ngrok_home          = Helper.home('.ngrok')
ngrok_unpacked_path = Helper.home('ngrok')

apt_package 'unzip'

remote_file ngrok_tar do
  owner Helper.user
  source ngrok_url
  mode '0644'
end

directory ngrok_home do
  owner Helper.user
  action :delete
  recursive true
end

bash 'unpack ngrok' do
  user Helper.user
  group Helper.group
  code "unzip -xzvf #{ngrok_tar} -C #{Helper.home}"
end

bash 'move ngrok' do
  user Helper.user
  group Helper.group
  code "mv #{ngrok_unpacked_path}* #{ngrok_home}"
end

file ngrok_tar do
  owner Helper.user
  action :delete
end

#cookbook_file Helper.home('.bashscripts/ngrok.bash') do
#  owner Helper.user
#  group Helper.group
#end
