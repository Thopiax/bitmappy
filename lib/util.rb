# frozen_string_literal: true
# ERROR HANDLING

def check_params(input, n)
  raise_arg_error 'wrong number of arguments' unless input.length == n
end

def raise_arg_error(msg)
  raise ArgumentError, msg
end

# UTIL
MATRIX_OFFSET = 1
MAX_INDEX = 250

def get_index(n)
  return n - MATRIX_OFFSET if (n >= 1) && (n <= MAX_INDEX)
  raise_arg_error 'Index out of bounds'
end

def get_params(input, param_count)
  check_params(input, param_count)
  # guard cases for painting the image
  c = input.pop if param_count > 2
  params = input.map(&:to_i)
  params.push(c) if param_count > 2
  params
end
