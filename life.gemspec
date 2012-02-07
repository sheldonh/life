# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "life/version"

Gem::Specification.new do |s|
  s.name        = "life"
  s.version     = Life::VERSION
  s.authors     = ["Sheldon Hearn"]
  s.email       = ["sheldonh@starjuice.net"]
  s.homepage    = "http://github.com/sheldonh/life"
  s.summary     = %q{Conway's game of life}
  s.description = %q{Ruby implementation of Conway's game of life}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.8.0"
  s.add_runtime_dependency "spinach", "~> 0.3.1"
end
