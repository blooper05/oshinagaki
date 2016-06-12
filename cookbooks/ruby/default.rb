### rbenv ###
git '/usr/local/rbenv' do
  repository 'https://github.com/rbenv/rbenv.git'
end

remote_file '/etc/profile.d/rbenv.conf.sh' do
  owner 'root'
  group 'root'
  mode '0644'
end
