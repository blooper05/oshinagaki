### Install ###
package 'nginx'

### Service ###
service 'nginx' do
  action %i(enable start)
end
