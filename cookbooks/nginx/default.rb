### Yum Repository ###
remote_file '/etc/yum.repos.d/nginx.repo' do
  owner 'root'
  group 'root'
  mode '0644'
end

### Install ###
package 'nginx'

### Service ###
service 'nginx' do
  action %i(enable start)
end
