# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_problem/version'

Gem::Specification.new do |spec|
  spec.name          = "api_problem"
  spec.version       = ApiProblem::VERSION
  spec.authors       = ["Guille Carlos"]
  spec.email         = ["guille@bitpop.in"]
  spec.description   = %q{An implementation of draft-nottingham-http-problem.}
  spec.summary       = %q{An implementation of draft-nottingham-http-problem.}
  spec.homepage      = "https://github.com/guillec/api_problem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
