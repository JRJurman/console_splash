# console_splash.rb 
# created by Jesse Jurman

class Console_Splash

  attr_accessor :screen, :lines, :columns

  #  Create a new screen Array with a given console size 
  #  (will be auto-generated otherwise using `stty size`)
  def initialize(lines=nil, columns=nil)
    @lines = lines ? lines : `stty size`.chomp.split()[0].to_i
    @columns = columns ? columns : `stty size`.chomp.split()[1].to_i
    @screen = Array.new(@lines, "#{' '*(@columns)}\n")
    @screen[-1] = "#{' '*(@columns)}"
  end

  #  Draw a continuous pattern on the top and bottom of the screen
  def write_horizontal_pattern(pattern="=")
    write_top_pattern(pattern)
    write_bottom_pattern(pattern)
  end

  #  Draw a continuous pattern on the sides of the screen
  def write_vertical_pattern(pattern="=")
    write_right_pattern(pattern)
    write_left_pattern(pattern)
  end

  #  Draw a continuous pattern on the top of the screen
  def write_top_pattern(pattern="=")
    strSize = pattern.size
    write_line(0, "#{pattern*((@columns-1)/strSize)}")
  end

  #  Draw a continuous pattern on the bottom of the screen
  def write_bottom_pattern(pattern="=")
    strSize = pattern.size
    write_line(-1, "#{pattern*((@columns-1)/strSize)}")
  end

  #  Draw a continuous pattern on the right side of the screen
  def write_right_pattern(pattern="=")
    count = 1
    @screen[(1..-2)].each do |line|
      write_line(count, pattern, (@columns-(pattern.size+1)))
      count += 1
    end
  end

  #  Draw a continuous pattern on the left side of the screen
  def write_left_pattern(pattern="=")
    count = 1
    @screen[(1..-2)].each do |line|
      write_line(count, pattern)
      count += 1
    end
  end

  #  Write the name of the application, the author
  #  and the version in a vim-esq manner
  def write_header(name, author, version)
    header = (@screen.size*(1.0/3.0)).to_i
    write_center(header, name)
    write_center(header+2, "version #{version}")
    write_center(header+3, "by #{author}")
  end

  #  Write to the center of the line
  def write_center(line, text)
    strSize = text.size
    buffer = (@columns - strSize)/2.0
    write_line(line, text, buffer)
  end

  #  Writes on the lines of the screen
  def write_line(line, text, start=0)
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

end
