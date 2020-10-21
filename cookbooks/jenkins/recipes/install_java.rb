#
# Cookbook:: jenkins
# Recipe:: install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'Install JAVA' do
    case node[:platform]
    when 'redhat', 'centos'
      package_name 'java-1.8.0-openjdk-devel'
    end
  end