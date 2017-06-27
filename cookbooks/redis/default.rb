# frozen_string_literal: true

### Yum Repository ###
remote_file '/etc/yum.repos.d/remi.repo' do
  mode '0644'
  owner 'root'
  group 'root'
end

### Install ###
package 'redis'

### Service ###
service 'redis' do
  action %i[enable start]
end
