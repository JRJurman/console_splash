# console_splash.rb 
# created by Jesse Jurman

require 'colorize'

class Console_Splash
  def self.splash()
    lines = `stty size`.chomp.split()[0].to_i
    columns = `stty size`.chomp.split()[1].to_i
    puts "#{lines}, #{columns}"
    screen = Array.new(lines, "\n")
    header = (lines*(3/4)).to_i
    screen[0] = "#{'*'*columns}\n".blue
    screen[-1] = "#{'*'*columns}".blue


    text = ""

    screen.each { |line| print line }
  end
end

#Console_Splash.splash
#gets
