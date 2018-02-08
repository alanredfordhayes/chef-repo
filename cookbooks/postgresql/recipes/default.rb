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


def linux_pg_initdb ()
  x = %x(postgresql-setup initdb)
end


def postgresql_initdb (dir1)
  if Dir.exist?(dir1) then
    dir_array = []
    Dir.foreach(dir1) {|x| dir_array.push(x)}
    if dir_array.length < 3 then
      puts "initdb not installed"
      linux_pg_initdb
    else
      puts "initdb installed"
    end
  end
end


def file_open_filter (file1, src1, rep1)
  if File.exits?(file1) then
    f = File.read(file1, mode='r')
    filter = f.gsub(src1, rep1)
    f.close()
    return filter
  end
end

package_install node['postgresql']['packages']
postgresql_initdb node['postgresql']['data']
capture = file_open_filter node['postgresql']['pg_hba'] , node['postgresql']['pg_hba']['orginal'], node['postgresql']['pg_hba']['replacement']
puts capture
