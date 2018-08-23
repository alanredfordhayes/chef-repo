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
        to_repo 'localhost:5043/powercli'
        to_tag '1.0.0'
        action :tag
    end

    docker_container 'powershel_ls' do
        repo 'localhost:5043/powercli'
        tag '1.0.0'
        command 'ls'
        action :run
    end
end