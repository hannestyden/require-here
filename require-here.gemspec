# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'require_here/version'

Gem::Specification.new do |s|
  s.name     = 'require-here'
  s.version  = RequireHere::Version::SEMANTIC
  s.authors  = [ 'Hannes Tydén' ]
  s.email    = [ 'hannes@soundcloud.com' ]
  s.homepage = 'http://github.com/hannestyden/require-here'
  s.summary  = 'Require constants into current namespace.'

  s.description = <<-DESCRIPTION
    Keep your namespaces clean.
  DESCRIPTION

  # Required for validation.
  s.rubyforge_project = 'require-here'

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.executables = `git ls-files -- bin/*`.
    split("\n").map { |f| File.basename(f) }

  s.require_paths = [ 'lib' ]

  dependencies =
    [
      [ 'minitest', '~> 2.11' ],
    ]

  developement_dependencies = []

  runtime_dependencies = []

  (dependencies + developement_dependencies).each do |dependency|
    s.add_development_dependency *dependency
  end

  (dependencies + runtime_dependencies).each do |dependency|
    s.add_runtime_dependency *dependency
  end
end
