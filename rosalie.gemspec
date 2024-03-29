# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rosalie/version"

Gem::Specification.new do |s|
  s.name        = "rosalie"
  s.version     = Rosalie::VERSION
  s.authors     = ["Ababii Alexandr"]
  s.email       = ["work.maki.5@gmail.com"]
  s.homepage    = "https://github.com/maki5/rosalie"
  s.summary     = "gem that allows users to message each over"
  s.description = "A Rails engine that alows users to send messages to each other"

  s.rubyforge_project = "rosalie"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
