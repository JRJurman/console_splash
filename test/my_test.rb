require './console_splash.rb'

splsh = Console_Splash.new(25,55)
splsh.write_top_pattern("%")
splsh.write_side_pattern("%".blue)
splsh.write_header("Foo", "Bar", "0.0.0")
puts ""
splsh.splash
puts ""
gets
