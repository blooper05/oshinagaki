### AWS CLI ###
remote_file '/etc/profile.d/aws-cli.conf.sh' do
  owner 'root'
  group 'root'
  mode '0644'
end

### Git ###
package 'git'

### Less ###
remote_file '/etc/profile.d/less.conf.sh' do
  owner 'root'
  group 'root'
  mode '0644'
end
