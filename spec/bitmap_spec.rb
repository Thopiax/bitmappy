# frozen_string_literal: true
require 'bitmap'

WIDTH  = 5
HEIGHT = 6

describe Bitmap do
  subject { Bitmap.new }

  before :each do
    subject.create_image(WIDTH, HEIGHT)
  end

  describe '#initialize' do
    context 'with good arguments' do
      it { expect(subject.width).to eq WIDTH }
      it { expect(subject.height).to eq HEIGHT }
      it { expect(subject.image).not_to be_empty }
    end

    context 'with bad arguments' do
      it { expect { Bitmap.new(-1, 0) }.to raise_error ArgumentError }
    end
  end

  describe '#set_pixel' do
    context 'with good arguments' do
      it do
        expect(subject.get_pixel(1, 1)).to eq 'O'
        subject.set_pixel(1, 1, 'C')
        expect(subject.get_pixel(1, 1)).to eq 'C'
      end
    end

    context 'with out of range indeces' do
      it { expect { subject.set_pixel(1, 260, 'C') }.to raise_error ArgumentError }
      it { expect { subject.set_pixel(-1, 5, 'C') }.to raise_error ArgumentError }
    end

    context 'with invalid color' do
      it { expect { subject.set_pixel(1, 1, 'c') }.to raise_error ArgumentError }
      it { expect { subject.set_pixel(1, 1, 5) }.to raise_error ArgumentError }
    end
  end

  describe '#clear_image' do
    context 'clears a colored board' do
      it do
        subject.set_pixel(1, 1, 'C')
        subject.clear_image
        expect(subject.image).to eq Bitmap.new.create_image(WIDTH, HEIGHT)
      end
    end
  end

  describe '#set_column' do
    context 'with good arguments' do
      it do
        subject.set_column(1, 1, 5, 'C')
        (1..5).each do |y|
          expect(subject.get_pixel(1, y)).to eq('C')
        end
      end
    end

    context 'with bad arguments' do
      it { expect { subject.set_column(-1, 5, 1, 'C') }.to raise_error ArgumentError }
      it { expect { subject.set_column(1, 5, -1, 'C') }.to raise_error ArgumentError }
    end

    context 'with order reversed' do
      it do
        subject.set_column(1, 5, 1, 'C')
        (1..5).each do |y|
          expect(subject.get_pixel(1, y)).to eq('C')
        end
      end
    end
  end

  describe '#set_row' do
    context 'with good arguments' do
      it do
        subject.set_row(1, 5, 1, 'C')
        (1..5).each do |x|
          expect(subject.get_pixel(x, 1)).to eq('C')
        end
      end
    end

    context 'with out of bound indeces' do
      it { expect { subject.set_row(-1, 5, 1, 'C') }.to raise_error ArgumentError }
      it { expect { subject.set_row(1, 5, -1, 'C') }.to raise_error ArgumentError }
    end

    context 'with order reversed' do
      it do
        subject.set_row(5, 1, 1, 'C')
        (1..5).each do |x|
          expect(subject.get_pixel(x, 1)).to eq('C')
        end
      end
    end
  end

  describe '#show' do
    it 'show empty matrix' do
      expect(subject.show).to eq([%w(O O O O O),
                                  %w(O O O O O), %w(O O O O O),
                                  %w(O O O O O), %w(O O O O O),
                                  %w(O O O O O)])
    end

    it 'show complex matrix' do
      subject.set_row(5, 1, 1, 'C')
      subject.set_column(1, 1, 5, 'W')
      subject.set_column(3, 3, 6, 'Z')
      expect(subject.show).to eq([%w(W C C C C),
                                  %w(W O O O O), %w(W O Z O O),
                                  %w(W O Z O O), %w(W O Z O O),
                                  %w(O O Z O O)])
    end
  end
end
