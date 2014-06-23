# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'holoman/version'

Gem::Specification.new do |s|
  s.name        = "holoman"
  s.version     = Holoman::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Cristian Ferrari"]
  s.email       = ["cristianferrarig@gmail.com"]
  s.homepage    = "http://github.com/cristianferrarig"
  s.summary     = %q{A short summary of your extension}
  s.description = %q{A longer description of your extension}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.executables  = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.executable    = "holoman"
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.3.3"])

  # Additional dependencies
  s.add_runtime_dependency("hologram", ["~> 1.1.0"])
  s.add_runtime_dependency("guard", ["~> 1.8.3"])
  s.add_runtime_dependency("guard-shell")
end
