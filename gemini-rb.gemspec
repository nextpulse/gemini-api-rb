# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gemini/version'

Gem::Specification.new do |spec|
  spec.name          = 'gemini-rb'
  spec.version       = Gemini::VERSION
  spec.authors       = ['Maros Hluska']
  spec.email         = ['mhluska@gmail.com']
  spec.summary       = %q{Gemini API Wrapper}
  spec.description   = %q{Simple Gemini API ruby wrapper}
  spec.homepage      = 'http://mhluska.com/'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*'] #`git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 0.15.3', '>= 0.15.3'
  spec.add_runtime_dependency 'eventmachine', '~> 1.2.7', '>= 1.2.7'
  spec.add_runtime_dependency 'faraday-detailed_logger', '~> 2.1.2', '>= 2.1.2'
  spec.add_runtime_dependency 'faye-websocket', '~> 0.10.7'
  spec.add_runtime_dependency 'json', '~> 2.1.0','>= 2.1.0'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.12.2', '>= 0.12.2'
end
