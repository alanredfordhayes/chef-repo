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
  f = File.read(file1)
  filter = f.gsub(src1, rep1)
  return filter
end


def file_write (data1, file1)
  f = File.open(file1, 'w')
  f.write(data1)
  f.close()
end


def file_include (file1, pattern1)
  f = File.read(file1)
  if f.include?(pattern1) then
    puts pattern1
    return pattern1
  end
end


def file_writer (file1, src1, rep1)
  if File.exist?(file1) then
    capture = file_open_filter file1, src1, rep1
    pattern = file_include file1, src1
    if pattern == src1 then
      file_write capture, file1
    end
  end
end


package_install node['postgresql']['packages']
postgresql_initdb node['postgresql']['data']
capture1 = file_writer node['postgresql']['path']['pg_hba'], node['postgresql']['pg_hba']['orginal'], node['postgresql']['pg_hba']['replacement']
