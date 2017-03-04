COOKBOOKS = %w(
  base
  certbot
  nginx
  ruby
).freeze

COOKBOOKS.each do |cookbook|
  include_recipe "../cookbooks/#{cookbook}/default.rb"
end
