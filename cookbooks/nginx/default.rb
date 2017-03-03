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

### Configuration Files ###
CONF_FILES = %w(
  /etc/nginx/nginx.conf
  /etc/nginx/conf.d/default.conf
).freeze

CONF_FILES.each do |file|
  remote_file file do
    owner 'root'
    group 'root'
    mode '0644'
  end
end

### Service ###
service 'nginx' do
  action %i(enable start)
end
