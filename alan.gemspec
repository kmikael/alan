# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alan/version'

Gem::Specification.new do |spec|
  spec.name          = "alan"
  spec.version       = Alan::VERSION
  spec.authors       = ["Mikael Konutgan"]
  spec.email         = ["mkonutgan@gmail.com"]
  spec.description   = %q{DSL for creating and running different automations}
  spec.summary       = %q{DSL for creating and running different automations}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
