# frozen_string_literal: true
require_relative 'bitmap'

class BitmapEditor
  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp.split
      cmd = input.shift
      begin
        case cmd
        when 'I'
          check_params input, 2
          # pass the converted integers into the function
          @image = Bitmap.new *(input.map &:to_i)
        when 'C'
          check_params input, 0
          @image.clear
        when 'L'
          check_params input, 3
          c = input.pop
          x, y = *(input.map &:to_i)
          @image.set_pixel(x, y, c)
        when 'V'
          check_params input, 4
          c = input.pop
          x, v1, v2 = *(input.map &:to_i)
          @image.set_column(x, v1, v2, c)
        when 'H'
          check_params input, 4
          c = input.pop
          h1, h2, y = *(input.map &:to_i)
          @image.set_row(h1, h2, y, c)
        when 'S'
          check_params input, 0
          @image.show
        when '?'
          show_help
        when 'X'
          exit_console
        else
          puts 'unrecognised command :('
        end
      rescue ArgumentError => e
        "invalid command: #{e}"
      end
    end
  end

  private

  def exit_console
    puts 'goodbye!'
    @running = false
  end

  def show_help
    puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
  end
end
