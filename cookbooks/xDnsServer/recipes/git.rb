

remote_file 'C:\Users\Public\Downloads\Git-2.18.0-64-bit.exe' do
  source 'https://github.com/git-for-windows/git/releases/download/v2.18.0.windows.1/Git-2.18.0-64-bit.exe'
  action :create
  notifies :install, 'windows_package[Git-2.18.0-64-bit.exe]', :immediately
end


windows_package 'Git-2.18.0-64-bit.exe' do
  source 'C:\Users\Public\Downloads\Git-2.18.0-64-bit.exe'
  action :nothing
end