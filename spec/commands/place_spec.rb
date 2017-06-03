require 'spec_helper'

module ToyRobot
  module Commands
    describe Place do
      let(:robot) { double }
      let(:table) { double(boundary: Table::Boundary.new(0, 0, 4, 4)) }

      subject { described_class.new(robot, table) }

      describe '#execute' do
        context 'valid arguments' do
          context 'position is within the table boundary and direction is valid' do
            let(:args) { [1, 4, 'NORTH'] }

            it 'places the Robot on the table' do
              expect(robot).to receive(:table=).with(table)
              expect(robot).to receive(:position=)
              subject.execute(*args)
            end
          end

          context 'position is within the table boundary but direction is invalid' do
            let(:args) { [1, 4, 'SOMEWHERE'] }

            it 'raises UnknownDirection' do
              expect { subject.execute(*args) }.to raise_error(UnknownDirection)
            end
          end

          context 'position is not within the table boundary and direction is invalid' do
            let(:args) { [5, 4, 'SOMEWHERE'] }

            it 'raises UnknownDirection' do
              expect { subject.execute(*args) }.to raise_error(UnknownDirection)
            end
          end

          context 'position is not within the table boundary but direction is valid' do
            let(:args) { [5, 4, 'NORTH'] }

            it 'raises PositionOutOfBounds' do
              expect { subject.execute(*args) }.to raise_error(PositionOutOfBounds)
            end
          end
        end

        context 'invalid arguments' do
          context 'no arguments' do
            let(:args) { nil }

            it 'raises ArgumentError' do
              expect { subject.execute(*args) }.to raise_error(ArgumentError)
            end
          end

          context 'insufficient arguments' do
            let(:args) { [1, 2] }

            it 'raises ArgumentError' do
              expect { subject.execute(*args) }.to raise_error(ArgumentError)
            end
          end
        end
      end
    end
  end
end
