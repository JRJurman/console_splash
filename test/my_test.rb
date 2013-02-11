# This is my own little test for checking functionality,
# It's not very formal, but it shows some of the methods
# and their usage, so feel free to branch off this example

require '../lib/console_splash.rb'

splsh = ConsoleSplash.new()
splsh.write_vertical_pattern("^_")
splsh.write_horizontal_pattern("<_")
splsh.write_center(-3, "Splash Screens are most Excellent!")
splsh.write_header("console_splash", "Jesse Jurman", "0.0.1")
splsh.splash
sleep(3)
