apt_package 'vim-nox'

cookbook_file Helper.home('.vimrc') do
	owner Helper.user
	group Helper.group
end

cookbook_file Helper.home('onedark.vim') do
	owner Helper.user
	group Helper.group
end

vundle_dir = Helper.home('.vim/bundle/Vundle.vim')

directory vundle_dir do
  owner Helper.user
  group Helper.group
end

git vundle_dir do
  user Helper.user
  group Helper.group
  repository 'https://github.com/VundleVim/Vundle.vim.git'
  reference 'master'
  action :sync
end

bash 'install vundle' do
	code <<-EOH
   	cp ~/onedark.vim ~/.vim/colors/
		vim +PluginInstall +qall
	EOH
end

