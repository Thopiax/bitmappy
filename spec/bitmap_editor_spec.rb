# frozen_string_literal: true
require 'bitmap_editor.rb'

describe BitmapEditor do
  subject { BitmapEditor.new }

  describe '#analyse_command' do
    it 'simple show' do
      subject.analyse_command('I 5 6')
      expect { subject.analyse_command('S') }.to output("OOOOO
OOOOO
OOOOO
OOOOO
OOOOO
OOOOO
").to_stdout
    end

    it 'not initialized' do
      expect { subject.analyse_command('S') }.to output("invalid command: you need to create an image first!\n").to_stdout
    end
  end
end
