# BitMappy - a simple bitmap editor

BitMappy is a simple, ruby-based, command line program that allows the user to create a pixel matrix of the size of their choice and "paint" them however they want. Try it yourself:

  1. Open your favorite terminal and go to the BitMappy root directory.
  2. Run `bundle install`
  3. Run `./bitmappy` (make sure this file has permission to run, if the command doesn't work, run `chmod +x bitmappy`)
  4. Enjoy :)

## Design

#### Test-Driven Design

  Even though I set up a framework for all the commands first, I decided to make my development for this task test driven. So I wrote tests for bitmap and bitmap_editor which should pass and then implemented the needed functionalities to actually get them to pass.

#### Bitmap class

  I created a different class to do operations on the bitmap to separate it from the app itself. This creates a good foundation for future development as well as hiding functionality from the main program. This also facilitated the development of DRY code.
#### Absence of a Command class

  Unlike the bitmap, I chose to omit a Command super-class and its children because it seemed to need a lot more code than a case by case analysis. The case by case is not only more readable, but simply adding another operation or case would involve adding 2 or 3 lines to the code, instead of a whole new class taking at least 10.

## Testing

  Running the tests is super simple! You will see results for rubocop tests as well as my custom rspec tests.
You can do it in two easy steps:

  1. Run `bundle install`
  2. Run `./bitmappy_test` (make sure this file has permission to run, if not run `chmod +x bitmappy_test`)
