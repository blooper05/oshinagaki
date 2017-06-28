# frozen_string_literal: true

COOKBOOKS = %w[
  base
  ffmpeg
  redis
  ruby
].freeze

COOKBOOKS.each do |cookbook|
  include_recipe "../cookbooks/#{cookbook}/default.rb"
end
