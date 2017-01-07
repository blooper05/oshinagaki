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

### rbenv-binstubs ###
git "#{RBENV_PATH}/plugins/rbenv-binstubs" do
  repository 'https://github.com/ianheggie/rbenv-binstubs.git'
end

### rbenv-default-gems ###
git "#{RBENV_PATH}/plugins/rbenv-default-gems" do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
end

### dependencies ###
DEPENDENCIES = %w(
  bzip2
  gcc
  gdbm-devel
  libffi-devel
  libyaml-devel
  ncurses-devel
  openssl-devel
  readline-devel
  zlib-devel
).freeze

DEPENDENCIES.each do |dependency|
  package dependency
end

### Ruby ###
VERSION = '2.4.0'.freeze

execute 'rbenv install' do
  command "source #{RBENV_CONF} && rbenv install #{VERSION}"
  not_if "source #{RBENV_CONF} && rbenv versions | grep #{VERSION}"
end

execute 'rbenv global' do
  command "source #{RBENV_CONF} && rbenv global #{VERSION}"
  not_if "source #{RBENV_CONF} && rbenv version | grep #{VERSION}"
end
