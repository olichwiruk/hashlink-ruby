lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hashlink/version'

Gem::Specification.new do |spec|
  spec.name          = 'hashlink'
  spec.version       = Hashlink::VERSION
  spec.authors       = ["Marcin Olichwiruk"]
  spec.email         = ['olichwiruk@gmail.com']

  spec.summary       = 'Ruby Cryptographic Hyperlinks Library'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that
  # have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|examples|templates)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'multibases', '~> 0.3.2'
  spec.add_dependency 'multihashes', '~> 0.2'

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
