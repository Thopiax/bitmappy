# frozen_string_literal: true
require 'bitmap'

WIDTH  = 5
HEIGHT = 6

describe Bitmap do
  before :each do
    @bitmap = Bitmap.new(WIDTH, HEIGHT)
  end

  describe '#initialize' do
    context 'with good arguments' do
      it { expect(@bitmap.width).to eq WIDTH }
      it { expect(@bitmap.height).to eq HEIGHT }
      it { expect(@bitmap.image).not_to be_empty }
    end

    context 'with bad arguments' do
      it { expect { Bitmap.new(-1, 0) }.to raise_error ArgumentError }
    end
  end

  
end
