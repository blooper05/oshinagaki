# frozen_string_literal: true

require 'spec_helper'

describe yumrepo('nginx') do
  it { is_expected.to exist }
  it { is_expected.to be_enabled }
end

describe package('nginx') do
  it { is_expected.to be_installed }
end

describe service('nginx') do
  it { is_expected.to be_enabled }
  it { is_expected.to be_running }
end

describe port(80) do
  it { is_expected.to be_listening }
end
