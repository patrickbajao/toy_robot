require 'spec_helper'

module ToyRobot
  describe Robot do
    describe '#on_table?' do
      let(:robot) { described_class.new }
      let(:table) { double }

      context 'table is set' do
        before do
          robot.table = table
        end

        it 'returns true' do
          expect(robot).to be_on_table
        end
      end

      context 'table is not set' do
        it 'returns false' do
          expect(robot).to_not be_on_table
        end
      end
    end
  end
end
