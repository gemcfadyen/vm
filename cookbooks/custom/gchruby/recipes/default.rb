cookbook_file Helper.home('.bashscripts/chruby.bash') do
  owner Helper.user
end

chruby_version       = '0.3.9'
chruby_url           = "https://github.com/postmodern/chruby/archive/v#{chruby_version}.tar.gz"
chruby_tar           = Helper.home("v#{chruby_tar}.tar.gz")
chruby_unpacked_path = Helper.home("chruby-#{chruby_version}")

remote_file chruby_tar do
  owner Helper.user
  source chruby_url
  mode '0644'
end

bash 'unpack chruby' do
  user Helper.user
  group Helper.group
  code "tar -xzvf #{chruby_tar} -C #{Helper.home}"
end

file chruby_tar do
  owner Helper.user
  action :delete
end

bash 'install chruby' do
  code <<-EOH
                cd #{chruby_unpacked_path}/
                  sudo make install
  EOH
end

bash 'touch ~/.ruby-version' do
  user Helper.user
  group Helper.group
  code 'touch ~/.ruby-version'
end
