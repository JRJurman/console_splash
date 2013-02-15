# This is my own little test for checking functionality,
# It's not very formal, but it shows some of the methods
# and their usage, so feel free to branch off this example

require "./console_splash"

('1'..'25').to_a.each do |i| 
  if i.size>1 
    print (i[-1]) 
  else 
    print (i)
  end
end
puts

splsh = ConsoleSplash.new()
colorScheme = {:fg=>:white, :bg=>:green}
splsh.write_vertical_pattern( "#", colorScheme )
#splsh.write_right_pattern( ">", :white, :yellow )
#splsh.write_left_pattern( "<", :white, :yellow )

splsh.write_horizontal_pattern( "$", colorScheme )
#splsh.write_top_pattern( "^", :blue, :white)
#splsh.write_bottom_pattern( "v", :green, :white)

splsh.write_header("console_splash", "jesse_jurman", "2.0.0")

splsh.splash
gets()
