# require-here

Keep your namespaces clean. Require constants into current namespace

[![Build Status](https://secure.travis-ci.org/hannestyden/require-here.png)](http://travis-ci.org/hannestyden/require-here)

# Example

```ruby
# File: a.rb

module GenericModuleName
  def self.method
    :a
  end
end

# File: b.rb

module GenericModuleName
  def self.method
    :b
  end
end

# File: space.rb

require 'require_here'

module Space
  module OnePlace
    require_here './a'
  end

  module AnotherPlace
    require_here './b'
  end
end

# The modules are not included into the global namespace.
GenericModuleName rescue $!
# => #<NameError: uninitialized constant Object::GenericModuleName>

# Also they are not reopened.
Space::OnePlace::GenericModuleName.method
# => :a
Space::AnotherPlace::GenericModuleName.method
# => :b
```
