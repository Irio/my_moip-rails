$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "my_moip-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "my_moip-rails"
  s.version     = MyMoipRails::VERSION
  s.authors     = ["Irio Irineu Musskopf Junior", "Bruno Pazzim"]
  s.email       = %w(irio.musskopf@caixadeideias.com.br bruno.pazzim@caixadeideias.com.br)
  s.homepage    = "https://github.com/Irio/my_moip-rails"
  s.summary     = "Payment's notifications"
  s.description = "MyMoip extras for Rails projects"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
