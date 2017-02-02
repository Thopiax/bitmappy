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

  describe '#set_pixel' do
    context 'with good arguments' do
      it do
        expect(@bitmap.get_pixel(1, 1)).to eq 'O'
        @bitmap.set_pixel(1, 1, 'C')
        expect(@bitmap.get_pixel(1, 1)).to eq 'C'
      end
    end

    context 'with out of range indeces' do
      it { expect { @bitmap.set_pixel(1, 260, 'C') }.to raise_error ArgumentError }
      it { expect { @bitmap.set_pixel(-1, 5, 'C') }.to raise_error ArgumentError }
    end

    context 'with invalid color' do
      it { expect { @bitmap.set_pixel(1, 1, 'c') }.to raise_error ArgumentError }
      it { expect { @bitmap.set_pixel(1, 1, 5) }.to raise_error ArgumentError }
    end
  end

  describe '#clear' do
    context 'clears a colored board' do
      it do
        @bitmap.set_pixel(1, 1, 'C')
        @bitmap.clear
        expect(@bitmap.image).to eq Bitmap.new(WIDTH, HEIGHT).image
      end
    end
  end

  describe '#set_column' do
    context 'with good arguments' do
      it do
        @bitmap.set_column(1, 1, 5, 'C')
        (1..5).each do |y|
          expect(@bitmap.get_pixel(1, y)).to eq('C')
        end
      end
    end

    context 'with bad arguments' do
      it { expect { @bitmap.set_column(-1, 5, 1, 'C') }.to raise_error ArgumentError }
      it { expect { @bitmap.set_column(1, 5, -1, 'C') }.to raise_error ArgumentError }
    end

    context 'with order reversed' do
      it do
        @bitmap.set_column(1, 5, 1, 'C')
        (1..5).each do |y|
          expect(@bitmap.get_pixel(1, y)).to eq('C')
        end
      end
    end

  end

  describe '#set_row' do
    context 'with good arguments' do
      it do
        @bitmap.set_row(1, 5, 1, 'C')
        (1..5).each do |x|
          expect(@bitmap.get_pixel(x, 1)).to eq('C')
        end
      end
    end

    context 'with out of bound indeces' do
      it { expect { @bitmap.set_row(-1, 5, 1, 'C') }.to raise_error ArgumentError }
      it { expect { @bitmap.set_row(1, 5, -1, 'C') }.to raise_error ArgumentError }
    end

    context 'with order reversed' do
      it do
        @bitmap.set_row(5, 1, 1, 'C')
        (1..5).each do |x|
          expect(@bitmap.get_pixel(x, 1)).to eq('C')
        end
      end
    end

  end

  describe '#show' do
    it do
    end
  end

end
