require 'require_here/version'

module RequireHere
  LOOKUP = {}

  def require_here(file_path)
    # Existing constants before require.
    existing = Object.constants

    require(file_path)

    # Introduced by require.
    introduced = Object.constants - existing

    # Move each introduced constant into the current namespace.
    introduced.each_with_index do |c, i|
      # Keep a reference to the constant.
      LOOKUP[i] = Object.const_get(c)
      # Remove the constant from the root.
      Object.send(:remove_const, c)
      # Place it in the current namespace.
      module_eval %Q(#{c} = ::RequireHere::LOOKUP[#{i}])
    end

    LOOKUP.clear
  end
end

class Module
  include RequireHere
end
