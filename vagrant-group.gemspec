# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-group/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-group"
  spec.version       = VagrantPlugins::Group::VERSION
  spec.authors       = ["Krzysztof Magosa"]
  spec.email         = ["krzysztof@magosa.pl"]
  spec.summary       = "Plugin allows to create groups of hosts and perform basic commands on them."
#  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
