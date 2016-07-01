%w(
  .vbox_version
  postinstall.sh
  .sudo_as_admin_successful
  .zlogin
).each do |f|
  file Helper.home(f) do
    owner Helper.user
    action :delete
  end
end

directory Helper.home('tmp') do
  owner Helper.user
  action :delete
  recursive true
end
