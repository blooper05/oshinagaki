### AWS CLI ###
remote_file '/etc/profile.d/aws_cli.sh' do
  mode '0775'
end

### Git ###
package 'git'

### Less ###
remote_file '/etc/profile.d/less.sh' do
  mode '0775'
end
