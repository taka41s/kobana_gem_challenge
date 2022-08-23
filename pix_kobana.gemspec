# frozen_string_literal: true

require_relative "lib/pix_kobana/version"

Gem::Specification.new do |spec|
  spec.name          = "pix_kobana"
  spec.version       = PixKobana::VERSION
  spec.authors       = ["Augusto Nunes"]
  spec.email         = ["gutonunes99@gmail.com"]

  spec.summary       = "Hi, that is my gem challenge"
  spec.description   = "Kobana pix challenge."
  spec.homepage      = "https://github.com/taka41s/"
  spec.required_ruby_version = ">= 2.4.0"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/taka41s/kobana_gem_challenge"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "uri", "~> 0.10.0"
  spec.add_dependency 'net-http', '~> 0.2.2'
  spec.add_dependency "openssl", "~> 2.2.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
