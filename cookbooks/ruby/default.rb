### rbenv ###
RBENV_PATH = '/usr/local/rbenv'.freeze
RBENV_CONF = '/etc/profile.d/rbenv.conf.sh'.freeze

git RBENV_PATH do
  repository 'https://github.com/rbenv/rbenv.git'
end

remote_file RBENV_CONF do
  owner 'root'
  group 'root'
  mode '0644'
end

### ruby-build ###
git "#{RBENV_PATH}/plugins/ruby-build" do
  repository 'https://github.com/sstephenson/ruby-build.git'
end
