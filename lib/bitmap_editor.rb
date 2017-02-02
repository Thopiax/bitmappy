class BitmapEditor
  WHITE_COLOR = 'O'

  def run
    @image = []
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
          init_image *(input.map &:to_i)
        when 'C'
          check_params input, 0
          clear_image
        when 'L'
          check_params input, 3
          c = input.pop
          x, y = *(input.map &:to_i)
          set_element_color x, y, c
        when 'V'
          check_params input, 4
          c = input.pop
          x, v1, v2 = *(input.map &:to_i)
          set_color_column x, v1, v2, c
        when 'H'
          check_params input, 4
          c = input.pop
          h1, h2, y = *(input.map &:to_i)
          set_color_row h1, h2, y, c
        when 'S'
          check_params input, 0
          show_image
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

    def init_image(n, m)
      if m.positive? && n.positive?
        @m = m
        @n = n
        clear_image
      else
        raise_arg_error "M and N both need to be positive"
      end
    end

    def clear_image
      @image = Array.new(@n) { Array.new(@m, WHITE_COLOR) }
    end

    def set_element_color(x, y, c)
      @image[get_index(y)][get_index(x)] = c
    end

    def set_color_column(x, v1, v2, c)
      v1..v2.each do |y|
        set_element_color(x, y, c)
      end
    end

    def set_color_row(h1, h2, y, c)
      h1..h2.each do |x|
        set_element_color(x, y, c)
      end
    end

    def show_image
      if @image.empty?
        puts 'you need to create an image first!'
      else
        @image.each { |row| puts row.join('') }
      end
    end

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

# ERROR HANDLING

def check_params(input, n)
   raise_arg_error "wrong number of arguments" unless input.length == n
end

def raise_arg_error(msg)
  raise ArgumentError, msg
end
