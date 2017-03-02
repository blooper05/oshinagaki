### Yum Repository ###
remote_file '/etc/yum.repos.d/nginx.repo' do
  owner 'root'
  group 'root'
  mode '0644'
end

### Install ###
package 'nginx' do
  options '--disablerepo=* --enablerepo=nginx'
end

### Service ###
service 'nginx' do
  action %i(enable start)
end
