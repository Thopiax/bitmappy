# frozen_string_literal: true
require_relative 'util'

class Bitmap
  WHITE_COLOR = 'O'
  COLOR_RANGE = 'A'..'Z'

  attr_reader :image, :width, :height

  def initialize
    @image = []
    @width = 0
    @height = 0
  end

  def create_image(m, n)
    if m.positive? && n.positive?
      @width = m
      @height = n
      clear_image
    else
      raise_arg_error('M and N both need to be positive')
    end
  end

  def clear_image
    check_image
    @image = Array.new(@height) { Array.new(@width, WHITE_COLOR) }
  end

  def get_pixel(x, y)
    check_image
    @image[get_index(y)][get_index(x)]
  end

  def set_pixel(x, y, c)
    check_image
    raise_arg_error 'invalid color' unless COLOR_RANGE.member?(c)
    @image[get_index(y)][get_index(x)] = c
  end

  def set_column(x, v1, v2, c)
    check_image
    range = v1 > v2 ? v2..v1 : v1..v2
    range.each do |y|
      set_pixel(x, y, c)
    end
  end

  def set_row(h1, h2, y, c)
    check_image
    range = h1 > h2 ? h2..h1 : h1..h2
    range.each do |x|
      set_pixel(x, y, c)
    end
  end

  def show
    check_image
    @image.each { |row| puts row.join('') }
  end

  private

  def check_image
    if @image.empty? && @width.zero? && @height.zero?
      raise_arg_error 'you need to create an image first!'
    end
  end
end
