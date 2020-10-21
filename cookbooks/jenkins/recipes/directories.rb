#
# Cookbook:: jenkins
# Recipe:: directories
#
# Copyright:: 2020, The Authors, All Rights Reserved.

directory '/scripts' do
    case node[:platform]
    when 'redhat', 'centos'
        owner 'root'
        group 'root'
        mode '0755'
        action :create
    end
  end