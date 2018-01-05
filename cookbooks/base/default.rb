# frozen_string_literal: true

### Yum ###
execute 'yum clean all && yum -y update' do
  not_if 'yum check-update'
end

### AWS CLI ###
remote_file '/etc/profile.d/aws-cli.conf.sh' do
  mode '0644'
  owner 'root'
  group 'root'
end

### Bash ###
remote_file '/etc/profile.d/bash.conf.sh' do
  mode '0644'
  owner 'root'
  group 'root'
end

### Git ###
package 'git'

### Less ###
remote_file '/etc/profile.d/less.conf.sh' do
  mode '0644'
  owner 'root'
  group 'root'
end

### NSS Softoken ###
remote_file '/etc/profile.d/nss-softokn.conf.sh' do
  mode '0644'
  owner 'root'
  group 'root'
end

### chrony ###
%w[ntp ntpdate].each do |package|
  package package do
    action :remove
  end
end

package 'chrony'

service 'chronyd' do
  action %i[enable start]
end

### aws-mon-linux ###
BIN_FILE = '/usr/local/bin/aws-mon.sh'

http_request BIN_FILE do
  path BIN_FILE
  mode '0775'
  url 'https://raw.githubusercontent.com/moomindani/aws-mon-linux/master/aws-mon.sh'
  not_if "test -e #{BIN_FILE}"
end

# TODO: cron
