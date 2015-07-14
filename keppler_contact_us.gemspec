$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "keppler_contact_us/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "keppler_contact_us"
  s.version     = KepplerContactUs::VERSION
  s.authors     = [""]
  s.email       = [""]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of KepplerContactUs."
  s.description = "TODO: Description of KepplerContactUs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "simple_form"
  s.add_dependency "haml_rails"

  s.add_development_dependency "sqlite3"
end
