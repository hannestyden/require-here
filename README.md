# require-here

Require constants into current namespace

[![Build Status](https://secure.travis-ci.org/hannestyden/require-here.png)](http://travis-ci.org/hannestyden/require-here)

# Example

```ruby
# lib_a.rb

module GenericModuleName
  def self.method
    :lib_a
  end
end

# lib_b.rb

module GenericModuleName
  def self.method
    :lib_b
  end
end

# app.rb

module Application
  module CertainAspect
    require_here 'lib_a.rb'
  end

  module AnotherCertainAspect
    require_here 'lib_b.rb'
  end
end

# The modules are not included, nor reopened, into the global namespace.
Application::CertainAspect::GenericModuleName.method        # => :lib_a
Application::AnotherCertainAspect::GenericModuleName.method # => :lib_b

GenericModuleName rescue $! # => #<NameError: uninitialized constant Object::GenericModuleName>
```
