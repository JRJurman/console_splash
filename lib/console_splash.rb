# console_splash.rb 
# created by Jesse Jurman

require 'colorize'
require './pixel'

class ConsoleSplash

  attr_accessor :screen, :lines, :columns

  #  Create a new screen Array with a given console size 
  #  (will be auto-generated otherwise using `stty size`)
  def initialize(lines=nil, columns=nil)
    @lines = lines ? lines : `stty size`.chomp.split()[0].to_i
    @columns = columns ? columns : `stty size`.chomp.split()[1].to_i
    @screen = Array.new(@lines) do
      Array.new(@columns) {Pixel.new(' ', nil, nil)} + [Pixel.new("\n",nil,nil)]
    end
    @screen[-1][-1] = Pixel.new("",nil,nil)
  end

  #  Draw a continuous pattern on the top and bottom of the screen
  def write_horizontal_pattern(pattern, opt={})
    write_top_pattern(pattern, opt)
    write_bottom_pattern(pattern, opt)
  end

  #  Draw a continuous pattern on the sides of the screen
  def write_vertical_pattern(pattern, opt={})
    write_left_pattern(pattern, opt)
    write_right_pattern(pattern, opt)
  end

  #  Draw a continuous pattern on the top of the screen
  def write_top_pattern(pattern, opt={})
    write_line(0, pattern*(@columns/pattern.size), opt)
  end

  #  Draw a continuous pattern on the bottom of the screen
  def write_bottom_pattern(pattern, opt={})
    write_line(-1, pattern*(@columns/pattern.size), opt)
  end

  #  Draw a continuous pattern on the right side of the screen
  def write_right_pattern(pattern, opt={})
    @screen.each { |line| write_right(@screen.index(line), pattern, opt) }
  end

  #  Draw a continuous pattern on the left side of the screen
  def write_left_pattern(pattern, opt={})
    @screen.each { |line| write_left(@screen.index(line), pattern, opt) }
  end

  #  Write the name of the application, the author
  #  and the version in a vim-esq manner
  def write_header(name, author, version, opt={})
    nameFg = opt[:nameFg]; authorFg = opt[:authorFg]; versionFg = opt[:versionFg];
    nameBg = opt[:nameBg]; authorBg = opt[:authorBg]; versionBg = opt[:versionBg];

    headLine = @lines/3
    write_center(headLine, name, {:fg=>nameFg, :bg=>nameBg})
    write_center(headLine+2, "version #{version}", {:fg=>versionFg, :bg=>versionBg})
    write_center(headLine+3, "created by #{author}", {:fg=>authorFg, :bg=>authorBg})
  end

  #  Write to the left of the line
  def write_left(line, text, opt={})
    write_line(line, text, opt.merge({:start=>0}))
  end
  
  #  Write to the right of the line
  def write_right(line, text, opt={})
    buffer = (@columns-text.size)
    write_line(line, text, opt.merge({:start=>buffer}))
  end

  #  Write to the center of the line
  def write_center(line, text, opt={})
    buffer = (@columns-text.size)/2
    write_line(line, text, opt.merge({:start=>buffer}))
  end

  #  Writes on the lines of the screen
  def write_line(line, text, opt={})
    fg = opt[:fg]; bg = opt[:bg]; start = (opt[:start] or 0)
    @screen[line][(start..(start+text.size-1))] = text.split('').map { |c| Pixel.new(c, fg, bg) }
  end

  #  Writes a single pixel on the screen
  def write_pixel( line, column, newChar, opt={} )
    fg = opt[:fg]; bg = opt[:bg]
    @screen[line][column] = Pixel.new(newChar, fg, bg)
  end

  #  Print the screen onto the display
  #  (developers are in charge of holding the
  #  prompt in focus (i.e. gets))
  def splash
    @screen.each { |line| line.each { |column| column.print_pixel } }
  end

end
