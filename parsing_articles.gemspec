
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "parsing_articles/version"



Gem::Specification.new do |spec|
  spec.name          = "parsing_articles"
  spec.version       = ParsingArticles::VERSION
  spec.authors       = ["morozartem9"]
  spec.email         = ["morozartem9@gmail.com"]

  spec.summary       = "parsing articles"
  spec.description   = " parsing articles from rss or facebook"
  spec.homepage      = "https://github.com/morozartem9/parsing_articles"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri", ">=1.8.2"
  spec.add_dependency "activesupport"
  spec.add_dependency "koala"

end
