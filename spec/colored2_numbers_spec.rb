require_relative 'spec_helper'
require_relative '../lib/colored2/numbers'
require_relative '../lib/colored2/strings'

RSpec.describe Fixnum do
  describe 'with foreground and background colors' do
    it 'should work with one color' do
      expect(32.red).to eql('32'.red)
    end
  end
end

RSpec.describe Float do
  describe 'with foreground and background colors' do
    it 'should add two colors chained' do
      expect((32.5).blue.on.red).to eql('32.5'.blue.on.red)
    end
  end
end
