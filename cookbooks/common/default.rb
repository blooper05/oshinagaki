### AWS CLI ###
remote_file '/etc/profile.d/aws-cli.conf.sh' do
  mode '0775'
end

### Git ###
package 'git'

### Less ###
remote_file '/etc/profile.d/less.conf.sh' do
  mode '0775'
end
