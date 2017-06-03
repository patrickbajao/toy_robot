require 'spec_helper'

module ToyRobot
  describe Position do
    describe '#outside?' do
      let(:boundary) { Table::Boundary.new(0, 0, 4, 4) }

      context 'outside minimum x-axis limit' do
        it 'returns true' do
          expect(described_class.new(-1, 4, 0)).to be_outside(boundary)
        end
      end

      context 'outside maximum x-axis limit' do
        it 'returns true' do
          expect(described_class.new(5, 2, 0)).to be_outside(boundary)
        end
      end

      context 'outside minimum y-axis limit' do
        it 'returns true' do
          expect(described_class.new(3, -1, 0)).to be_outside(boundary)
        end
      end

      context 'outside maximum y-axis limit' do
        it 'returns true' do
          expect(described_class.new(0, 5, 0)).to be_outside(boundary)
        end
      end

      context 'within the min and max limits of boundary' do
        it 'returns false' do
          expect(described_class.new(2, 3, 0)).to_not be_outside(boundary)
        end
      end
    end

    describe '#direction' do
      [[0, :north], [90, :east], [180, :south], [270, :west]].each do |d|
        context "bearing is set to #{d.first}" do
          it "returns #{d.last}" do
            expect(described_class.new(1, 2, d.first).direction).to eq(d.last)
          end
        end
      end
    end

    describe '#to_s' do
      it 'returns string representation of Position object' do
        expect(described_class.new(1, 2, 0).to_s).to eq('1,2,NORTH')
      end
    end
  end
end
