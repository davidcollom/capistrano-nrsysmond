# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capistrano-nrsysmond/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["David Collom"]
  gem.email         = ["david@collom.co.uk"]
  gem.description   = %q{Capistrano recipe for installing the newrelic sysmond service on multiple operating systems}
  gem.summary       = %q{newrelic sysmond recipe}
  gem.homepage      = "https://github.com/davidcollom/capistrano-nrsysmond"

  # gem.files         = `git ls-files`.split($\)
  gem.files         = Dir.glob("lib/**/*") + %w{ README.md LICENSE }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capistrano-nrsysmond"
  gem.require_paths = ["lib"]
  gem.version       = Capistrano::Nrsysmond::VERSION

  gem.add_runtime_dependency "capistrano"
end
