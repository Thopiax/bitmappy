# frozen_string_literal: true
require_relative 'util'

class Bitmap
  WHITE_COLOR = 'O'
  COLOR_RANGE = 'A'..'Z'

  attr_reader :image, :width, :height

  def initialize(m, n)
    @image = []
    if m.positive? && n.positive?
      @width = m
      @height = n
      clear
    else
      raise_arg_error('M and N both need to be positive')
    end
  end

  def clear
    @image = Array.new(@height) { Array.new(@width, WHITE_COLOR) }
  end

  def get_pixel(x, y)
    @image[get_index(y)][get_index(x)]
  end

  def set_pixel(x, y, c)
    raise_arg_error "invalid color" unless COLOR_RANGE.member?(c)
    @image[get_index(y)][get_index(x)] = c
  end

  def set_column(x, v1, v2, c)
    (v1..v2).each do |y|
      set_pixel(x, y, c)
    end
  end

  def set_row(h1, h2, y, c)
    (h1..h2).each do |x|
      set_pixel(x, y, c)
    end
  end

  def show
    if @image.empty?
      puts 'you need to create an image first!'
    else
      @image.each { |row| puts row.join('') }
    end
  end
end
