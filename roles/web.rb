COOKBOOKS = %w(
  base
  nginx
).freeze

COOKBOOKS.each do |cookbook|
  include_recipe "../cookbooks/#{cookbook}/default.rb"
end
