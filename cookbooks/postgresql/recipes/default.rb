#
# Cookbook:: postgresql
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


def package_install_single (name)
  installer = package "#{name}" do action :install end
  return installer
end


def package_install_multiple (var1)
  installer_array = []
  for name in var1 do
    installer = package_install_single name
    installer_array.push(installer)
  end
  return installer_array
end


def package_install (var1)
  if var1.kind_of?(Array) then
    installer = package_install_multiple var1
  else
    installer = package_install_single
  end
end



package_install node['postgresql']['packages']
