require '../lib/console_splash.rb'

splsh = Console_Splash.new()
splsh.write_vertical_pattern("^_")
splsh.write_horizontal_pattern("<_")
splsh.write_center(-3, "Hello Nurse")
splsh.write_header("console_splash", "Jesse Jurman", "0.0.1")
splsh.splash
sleep(3)
