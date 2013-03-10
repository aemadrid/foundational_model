# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foundational/model/version'

Gem::Specification.new do |gem|
  gem.name          = 'foundational_model'
  gem.version       = Foundational::Model::VERSION
  gem.authors       = ['Adrian Madrid']
  gem.email         = %w(aemadrid@gmail.com)
  gem.description   = %q{Foundational Model allows you to persist models into FoundationDB.}
  gem.summary       = %q{Foundational Model allows you to persist models into FoundationDB.}
  gem.homepage      = 'https://github.com/aemadrid/foundational_model'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w(lib)

  gem.add_dependency 'foundational', '~> 0.0.2'
  gem.add_dependency 'virtus'

  gem.add_development_dependency 'rspec', '~> 2.8.0'
  gem.add_development_dependency 'virtus-rspec'
  gem.add_development_dependency 'simplecov', '~> 0.7.1'
end
