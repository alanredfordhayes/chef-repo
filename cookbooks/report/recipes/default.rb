#
# Cookbook:: report
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform_family']
when 'rhel'
    docker_installation 'default'

    docker_service_manager 'default' do
        action :start
    end

    docker_image 'vmware/powerclicore' do 
        action :pull
    end

    docker_tag 'private repo tag for powercli:1.0.0' do
        target_repo 'vmware/powerclicore'
        target_tag 'latest'
        to_repo 'localhost/powercli'
        to_tag '1.0.0'
        action :tag
    end

    %w{scripts logs}.each do |vol|
    	docker_volume vol do
		action :create
	end
    end
end
