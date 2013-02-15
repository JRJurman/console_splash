# pixel.rb
# Created by Jesse Jurman

require 'colorize'

class Pixel

  attr_accessor :char, :fcolor, :bcolor

  def initialize( char=' ', fcolor=:white, bcolor=nil )
    @char = char
    @fcolor = fcolor
    @bcolor = bcolor
  end

  def print_pixel
    print char.colorize( :color => fcolor, :background => bcolor )
  end

end
