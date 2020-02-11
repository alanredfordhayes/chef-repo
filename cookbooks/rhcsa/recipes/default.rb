#
# Cookbook:: rhcsa
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

directory '/study' do
    owner 'root'
    group 'root'
    mode '0755'
end

template '/study/goodfile' do
    source 'goodfile.erb'
    owner 'root'
    group 'root'
    mode '0755'
end

template '/study/badfile' do
    source 'badfile.erb'
    owner 'root'
    owner 'root'
    mode '0755'
end

remote_file '/study/CentOS-8.1.1911-x86_64-dvd1.iso' do
    source 'http://mirror.math.princeton.edu/pub/centos/8.1.1911/isos/x86_64/CentOS-8.1.1911-x86_64-dvd1.iso'
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end