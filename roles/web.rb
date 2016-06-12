COOKBOOKS = %w(
  base
  nginx
  ruby
).freeze

COOKBOOKS.each do |cookbook|
  include_recipe "../cookbooks/#{cookbook}/default.rb"
end
