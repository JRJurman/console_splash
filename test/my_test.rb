require '../lib/console_splash.rb'

splsh = Console_Splash.new()
splsh.write_top_pattern("^")
splsh.write_bottom_pattern("v")
splsh.write_left_pattern("<")
splsh.write_right_pattern(">")
splsh.write_header("console_splash", "Jesse Jurman", "0.0.1")
puts ""
splsh.splash
puts ""
gets
