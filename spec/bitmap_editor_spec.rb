require "bitmap_editor"

describe BitmapEditor do
  before do
    _, @writer = IO.pipe
    @bit_edit = BitmapEditor.new
  end

  describe "initialize" do
    context "given 2 positive parameters" do
      it "creates a new image and stores the coordinates" do
        @writer.puts "I 2 3"
        @bit_edit.run
        expect(@bit_edit.m).to eq(3)
        expect(@bit_edit.n).to eq(2)
        expect(@bit_edit.image).to eq([['O','O'],['O','O'],['O','O']])
      end
    end
  end

end
