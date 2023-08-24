# frozen_string_literal: false

require 'spec_helper'
require 'colored2/strings'

RSpec.describe Colored2 do
  describe 'global enable and disable' do
    before do
      described_class.disable!
    end

    after do
      described_class.enable!
    end

    let(:sample) { 'sample string' }

    describe 'colors' do
      subject { sample.red.on.blue }

      it { is_expected.to eql(sample) }
    end

    describe 'effects' do
      subject { sample.bold.on.red }

      it { is_expected.to eql(sample) }
    end
  end
end
