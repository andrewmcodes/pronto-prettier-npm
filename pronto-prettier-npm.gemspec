# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pronto/prettier/npm/version"

Gem::Specification.new do |spec|
  spec.name          = "pronto-prettier-npm"
  spec.version       = Pronto::Prettier::Npm::VERSION
  spec.authors       = ["Andrew Mason"]
  spec.email         = ["andrewmcodes@protonmail.com"]

  spec.summary = "Pronto runner for Prettier"
  spec.description = "Run Prettier, an opinionated code formatter, using Pronto."
  spec.homepage = "https://github.com/andrewmcodes/pronto-prettier-npm"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/andrewmcodes/pronto-prettier-npm"
    # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r(^exe/)) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.requirements << "Prettier (in PATH)"

  # Dependencies
  spec.add_dependency "pronto", "~> 0.10.0"

  # Development dependencies
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.66.0"
end
