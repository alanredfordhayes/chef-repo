#
# Cookbook:: docker_qs
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


    package 'docker-engine' do
        action :nothing
    end

    execute 'Yum Update' do
        command 'yum update -y'
        action :nothing
        notifies :install, 'package[docker-engine]'
    end

    cookbook_file 'docker.repo' do
        path '/etc/yum.repos.d/docker.repo'
        action :create
        notifies :run, 'execute[Yum Update]'
    end

    service "docker" do
        action [:enable, :start]
    end

    user 'give vagrant user docker' do
        username 'vagrant'
        gid 'docker'
        action :modify
    end

