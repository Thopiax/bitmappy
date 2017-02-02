# frozen_string_literal: true
require_relative 'bitmap'

class BitmapEditor
  def run
    @image = nil
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp.split
      cmd = input.shift
      begin
        case cmd
        when 'I'
          @image = Bitmap.new(*get_params(input, 2))
        when 'C'
          raise_arg_error "you need to create an image first" if @image.nil?
          check_params input, 0
          @image.clear
        when 'L'
          raise_arg_error "you need to create an image first" if @image.nil?
          @image.set_pixel(*get_params(input, 3))
        when 'V'
          raise_arg_error "you need to create an image first" if @image.nil?
          @image.set_column(*get_params(input, 4))
        when 'H'
          raise_arg_error "you need to create an image first" if @image.nil?
          @image.set_row(*get_params(input, 4))
        when 'S'
          check_params input, 0
          raise_arg_error "you need to create an image first" if @image.nil? 
          @image.show
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

  def get_params(input, param_count)
    check_params(input, param_count)
    # guard cases for painting the image
    c = input.pop if param_count > 2
    params = input.map &:to_i
    params.push(c) if param_count > 2
    params
  end
end
