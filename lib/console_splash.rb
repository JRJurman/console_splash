# console_splash.rb 
# created by Jesse Jurman

require 'colorize'

class Console_Splash

  attr_accessor :screen, :lines, :columns

  #  Create a new screen Array with a given console size 
  #  (will be auto-generated otherwise using `stty size`)
  def initialize(lines=nil, columns=nil)
    @lines = lines ? lines : `stty size`.chomp.split()[0].to_i
    @columns = columns ? columns : `stty size`.chomp.split()[1].to_i
    @screen = Array.new(@lines, "#{' '*(@columns-1)}\n")
  end

  #  Draw a continuous pattern on the top and bottom of the screen
  def write_top_pattern(pattern="=")
    strSize = rip_color(pattern).size
    line_write(0, "#{pattern*(@columns/strSize)}\n")
    line_write(-1, "#{pattern*(@columns/strSize)} ")
  end

  #  Draw a continuous pattern on the sides of the screen
  def write_side_pattern(pattern="=")
    count = 1
    @screen[(1..-2)].each do |line|
      line_write(count, pattern)
      line_write(count, pattern, @columns-(rip_color(pattern).size))
      count += 1
    end
  end

  #  Write the name of the application, the author
  #  and the version in a vim-esq manner
  def write_header(name, author, version)
    header = (@screen.size*(1.0/3.0)).to_i
    center_write(header, name)
    center_write(header+2, "version #{version}")
    center_write(header+3, "by #{author}")
  end

  #  Write to the center of the line
  def center_write(line, text)
    strSize = rip_color(text).size
    buffer = (@columns - strSize)/2.0
    line_write(line, text, buffer)
  end

  #  Writes on the lines of the screen
  def line_write(line, text, start=0)
    buffer = @screen[line].split('')
    buffer[start..(start+text.size()-1)] = text.split('')
    @screen[line] = buffer.join('')
  end

  #  Print the screen onto the display
  #  (developers are in charge of holding the
  #  prompt in focus (i.e. gets))
  def splash
    @screen.each { |line| print line }
  end

  #  Get string out of colorized_string
  def rip_color(text)
    if text.include?("\e")
      i = text.index('m')
      f = text.index("\e[0m")
      realString = text[(i)..(f-1)]
      res = ""
      res += text[0..(i-9)] if i != 9
      res += realString
      res += text[(f+4)..-1] if f != text.size() - 4
      res
    else
      text
    end
  end

end
