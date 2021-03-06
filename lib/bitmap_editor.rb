# frozen_string_literal: true
require_relative 'bitmap'

class BitmapEditor
  def initialize
    @bitmap = Bitmap.new
  end

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      cmd = gets.chomp
      analyse_command(cmd)
    end
  end

  def analyse_command(cmd)
    input = cmd.split
    op    = input.shift
    begin
      case op
      when 'I'
        @bitmap.create_image(*get_params(input, 2))
      when 'C'
        check_params input, 0
        @bitmap.clear_image
      when 'L'
        @bitmap.set_pixel(*get_params(input, 3))
      when 'V'
        @bitmap.set_column(*get_params(input, 4))
      when 'H'
        @bitmap.set_row(*get_params(input, 4))
      when 'S'
        check_params input, 0
        @bitmap.show
      when '?'
        check_params input, 0
        show_help
      when 'X'
        check_params input, 0
        exit_console
      else
        puts 'unrecognised command :('
      end
    rescue ArgumentError => e
      puts "invalid command: #{e}"
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
