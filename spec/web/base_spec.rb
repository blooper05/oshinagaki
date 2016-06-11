require 'spec_helper'

describe command('printenv AWS_DEFAULT_REGION') do
  let(:disable_sudo) { true }
  its(:stdout) { is_expected.to match('ap-northeast-1') }
end

describe package('git') do
  it { is_expected.to be_installed }
end

describe command('printenv LESS') do
  let(:disable_sudo) { true }
  its(:stdout) { is_expected.to match('-inqMRS') }
end

describe command('printenv LESSCHARSET') do
  let(:disable_sudo) { true }
  its(:stdout) { is_expected.to match('utf-8') }
end
