#
# Cookbook:: chef-server
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory '/scripts' do
	action :create
end

execute 'modify install-chef-server.sh' do
	command 'chmod u+x /scripts/install-chef-server.sh'
	action:nothing
	notifies :run, 'execute[run install-chef-server.sh]', :immediately
end

execute 'run install-chef-server.sh' do 
	command '/scripts/install-chef-server.sh'
	action :nothing
end

template '/scripts/install-chef-server.sh' do
	source 'install-chef-server.sh.erb'
	owner 'root'
	group 'root'
	mode '077'
	notifies :run, 'execute[modify install-chef-server.sh]', :immediately
end
