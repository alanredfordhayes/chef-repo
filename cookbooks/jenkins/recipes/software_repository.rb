#
# Cookbook:: jenkins
# Recipe:: jenkins_software_repository
#
# Copyright:: 2020, The Authors, All Rights Reserved.

remote_file '/etc/yum.repos.d/jenkins.repo' do
  case node[:platform]
  when 'redhat', 'centos'
    source 'http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo'
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
end

template '/scripts/software_repostiory.sh' do
  case node[:platform]
  when 'redhat', 'centos'
    source 'software_repostiory.erb'
    mode '0644'
    owner 'root'
    group 'root'
  end
end