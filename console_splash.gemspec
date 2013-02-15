Gem::Specification.new do |s|
  s.name          = "console_splash"
  s.version       = "2.0.1"
  s.date          = "2013-02-15"
  s.authors       = ["Jesse Jurman"]
  s.summary       = "Splash screen gem for command line ruby programs"
  s.description   = "Allows developers to give programs a vim-esq splash screen"
  s.email         = "j.r.jurman@gmail.com"
  s.homepage      = "https://github.com/JRJurman/console_splash"
  s.files         = ["lib/console_splash.rb", "lib/console_splash/pixel.rb"]
  s.add_runtime_dependency 'colorize' 
end
