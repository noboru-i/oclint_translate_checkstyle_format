# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oclint_translate_checkstyle_format/version'

Gem::Specification.new do |spec|
  spec.name          = 'oclint_translate_checkstyle_format'
  spec.version       = OclintTranslateCheckstyleFormat::VERSION
  spec.authors       = ["noboru-i"]
  spec.email         = ["ishikura.noboru@gmail.com"]

  spec.summary       = 'Translate OCLint json format into checkstyle format.'
  spec.description   = 'Translate OCLint json format into checkstyle format.'
  spec.homepage      = 'https://github.com/noboru-i/oclint_translate_checkstyle_format'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'coveralls'
end
