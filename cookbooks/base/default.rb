# frozen_string_literal: true
### Yum ###
execute 'yum clean all'
execute 'yum -y update'

### AWS CLI ###
remote_file '/etc/profile.d/aws-cli.conf.sh' do
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
