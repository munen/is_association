# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "is_association/version"

Gem::Specification.new do |s|
  s.name        = "is_association"
  s.version     = IsAssociation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alain M. Lafon"]
  s.email       = ["alain.lafon@dispatched.ch"]
  s.homepage    = ""
  s.summary     = "Is a relation an association?"
  s.description = %q{Patches ActiveRecord::Base to expose a method
    is_association? The method will return true for all associations like
    has_one, has_many and belongs_to while returning false for regular attributes
    on the table.
  }

  s.rubyforge_project = "is_association"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  Gem::Specification.new do |s|
    s.add_development_dependency "rspec"
    s.add_development_dependency "activerecord", [">= 3.0.0"]
  end
end
