### Install ###
BIN_FILE = '/usr/local/bin/certbot-auto'.freeze

http_request BIN_FILE do
  path BIN_FILE
  mode '0775'
  url 'https://dl.eff.org/certbot-auto'
  not_if "test -e #{BIN_FILE}"
end

### Generate ###
ADDRESS = ''.freeze
DOMAINS = %w(
).freeze

OPTIONS = "-d #{DOMAINS.join(',')} --agree-tos -n -m #{ADDRESS} --debug".freeze
COMMAND = "#{BIN_FILE} certonly #{OPTIONS}".freeze

execute "#{COMMAND} --standalone" do
  not_if "test -e /etc/letsencrypt/live/#{DOMAINS[0]}"
end

### Update ###
WWW_DIR = '/var/www'.freeze

directory WWW_DIR do
  owner 'ec2-user'
  group 'ec2-user'
end

execute "#{COMMAND} --webroot -w #{WWW_DIR} --force-renewal" do
  not_if "test -e #{WWW_DIR}/.well-known"
end

### Cron ###
# TODO
