# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "avvo_api/version"

Gem::Specification.new do |s|
  s.name        = "avvo_api"
  s.version     = AvvoApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Weiss"]
  s.email       = ["jweiss@avvo.com"]
  s.homepage    = "http://api.avvo.com"
  s.summary     = %q{An ActiveResource client to the Avvo API}
  s.description = %q{An ActiveResource client to the Avvo API}

  s.add_dependency "reactive_resource", '~> 0.5'
  s.add_development_dependency "shoulda", '~> 2.11.3'
  s.add_development_dependency "webmock", '~> 1.6.1'
  
  s.rubyforge_project = "avvo_api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
