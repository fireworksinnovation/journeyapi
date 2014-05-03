$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "journeyapi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "journeyapi"
  s.version     = Journeyapi::VERSION
  s.authors     = ["Carl Kritzinger"]
  s.email       = ["ckritzinger@gmail.com"]
  s.homepage    = "https://github.com/ckritzinger/journeyapi"
  s.summary     = "Buidl journey API"
  s.description = "Build journey API."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activeresource"
end
