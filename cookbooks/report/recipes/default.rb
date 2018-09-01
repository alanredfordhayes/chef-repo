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

<<<<<<< HEAD
    %w{scripts logs}.each do |vol|
    	docker_volume vol do
		action :create
	end
=======
<<<<<<< HEAD
    docker_volume 'log'
    docker_volume 'scripts'
    docker_volume 'data'

    file 'get-vm.ps1' do
        path '/var/lib/docker/volumes/scripts/_data/get-vm.ps1'
        mode '0755'
        owner 'root'
        group 'root'
        action :create
    end

    file 'connection.csv' do
        path '/var/lib/docker/volumes/data/_data/connection.csv'
        mode '0755'
        owner 'root'
        group 'root'
        action :create
    end

    docker_container 'powercli_getvm' do
        repo 'localhost/powercli'
        entrypoint "/usr/bin/pwsh"
        volumes ['scripts:/tmp/scripts:ro', 'data:/tmp/data/management:ro', 'log:/tmp/log:rw']
=======
    docker_container 'powershel_ls' do
        repo 'localhost/powercli'
>>>>>>> fa6ad130d9332d07b19c819c6a73e6321aa2e9cb
        tag '1.0.0'
        command '/tmp/scripts/get-vm.ps1'
        action :run
>>>>>>> 18b42fc0f51e5bd6d83fe8ff3b73a9d1702099d9
    end
<<<<<<< HEAD

end
=======
end
>>>>>>> fa6ad130d9332d07b19c819c6a73e6321aa2e9cb
