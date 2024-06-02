# frozen_string_literal: true

require_relative "lib/turbo_react/version"

Gem::Specification.new do |spec|
  spec.name = "turbo_react"
  spec.version = TurboReact::VERSION
  spec.authors = ["Carl Dawson"]
  spec.email = ["carldawson@hey.com"]

  spec.summary = "Adds React to Rails 7 apps which use jsbundling."
  spec.description = "turbo_react integrates React into Rails 7 apps and allows you to combine the power of Hotwire with React."
  spec.homepage = "https://github.com/carldaws/turbo_react"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
