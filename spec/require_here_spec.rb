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

describe 'require_here' do
  it 'should require the constants into the current namespace' do
    module M
      require_here './spec/support/lib_a'
    end

    defined?(M::A).must_equal 'constant'
  end

  it 'should not require the constants into the global namespace' do
    module M
      require_here './spec/support/lib_a'
    end

    lambda do
      A
    end.must_raise NameError
  end
end
