# frozen_string_literal: false

require File.expand_path('spec/spec_helper')
require 'colored2/numbers'
require 'colored2/strings'

RSpec.describe 'Numbers' do
  describe Colored2.integer_class do
    describe 'with foreground and background colors' do
      it 'works with one color' do
        expect(32.red).to eql('32'.red)
      end

      it 'inserts escape sequences' do
        expect(32.red).to eql("\e[31m32\e[0m")
      end
    end
  end

  describe Float do
    describe 'with foreground and background colors' do
      it 'adds two colors chained' do
        expect(32.5.blue.on.red).to eql('32.5'.blue.on.red)
      end

      it 'inserts escape sequences' do
        expect(32.5.blue.on.red).to eql("\e[41m\e[34m32.5\e[0m")
      end
    end
  end
end
