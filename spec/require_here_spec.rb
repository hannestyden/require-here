# Ensure gem is used over 1.9.x built in.
gem 'minitest' if RUBY_VERSION =~ /1.9.\d/

require 'minitest/spec'
require 'minitest/autorun'

$:.push File.expand_path('../../lib', __FILE__)
require 'require_here'

module RequireHere
  module Version
    describe 'semantic' do
      it 'should be of version 0.0.0' do
        SEMANTIC.must_equal '0.0.0'
      end
    end
  end
end
