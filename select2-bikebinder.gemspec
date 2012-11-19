# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'select2-bikebinder'

Gem::Specification.new do |s|
  s.name = %q{select2-bikebinder}
  s.version = Select2BikeBinder::VERSION
  s.homepage = "http://freeridepg.org/"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{William Wedler}]
  s.date = %q{2012-11-18}
  s.description = %q{Add assets to the rails pipeline for building user interface elements with select2 library}
  s.email = %q{wedler.w@freeridepgh.org}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = `git ls-files`.split("\n")
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{Add assets to the rails pipeline for building user interface elements with select2 library}

  s.add_development_dependency(%q<rake>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
  s.add_development_dependency(%q<bundler>, ["~> 1.2"])
  s.add_development_dependency "rails", "~> 3.0"

  s.add_development_dependency "railties", ">= 3.0", "< 5.0"

  s.add_dependency(%q<rspec>, [">= 1.3.0"])
  s.add_dependency(%q<bundler>, ["~> 1.2"])
  s.add_dependency "rails", "~> 3.0"

  s.add_dependency "railties", ">= 3.0", "< 5.0"

end

