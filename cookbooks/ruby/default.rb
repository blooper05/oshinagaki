# frozen_string_literal: true
### rbenv ###
RBENV_ROOT = '/usr/local/rbenv'
RBENV_CONF = '/etc/profile.d/rbenv.conf.sh'

git RBENV_ROOT do
  repository 'https://github.com/rbenv/rbenv.git'
end

remote_file RBENV_CONF do
  owner 'root'
  group 'root'
  mode '0644'
end

### ruby-build ###
git "#{RBENV_ROOT}/plugins/ruby-build" do
  repository 'https://github.com/sstephenson/ruby-build.git'
end

### rbenv-default-gems ###
git "#{RBENV_ROOT}/plugins/rbenv-default-gems" do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
end

remote_file "#{RBENV_ROOT}/default-gems" do
  owner 'root'
  group 'root'
  mode '0644'
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
VERSION = '2.4.0'

execute 'rbenv install' do
  command "source #{RBENV_CONF} && rbenv install #{VERSION}"
  not_if "source #{RBENV_CONF} && rbenv versions | grep #{VERSION}"
end

execute 'rbenv global' do
  command "source #{RBENV_CONF} && rbenv global #{VERSION}"
  not_if "source #{RBENV_CONF} && rbenv version | grep #{VERSION}"
end
