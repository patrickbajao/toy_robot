require 'spec_helper'

module ToyRobot
  module Commands
    describe Move do
      let(:robot) { Robot.new }
      let(:table) { double(boundary: Table::Boundary.new(0, 0, 4, 4)) }

      subject { described_class.new(robot, table) }

      describe '#execute' do
        context 'robot is on table' do
          before do
            allow(robot).to receive(:on_table?) { true }
          end

          context 'within the table boundary' do
            before do
              robot.position = Position.new(2, 3, bearing)
              subject.execute
            end

            context 'current direction is north' do
              let(:bearing) { 0 }

              it 'moves the robot upward' do
                expect(robot.position.x).to eq(2)
                expect(robot.position.y).to eq(4)
              end
            end

            context 'current direction is south' do
              let(:bearing) { 180 }

              it 'moves the robot downward' do
                expect(robot.position.x).to eq(2)
                expect(robot.position.y).to eq(2)
              end
            end

            context 'current direction is east' do
              let(:bearing) { 90 }

              it 'moves the robot to the right' do
                expect(robot.position.x).to eq(3)
                expect(robot.position.y).to eq(3)
              end
            end

            context 'current direction is west' do
              let(:bearing) { 270 }

              it 'moves the robot to the left' do
                expect(robot.position.x).to eq(1)
                expect(robot.position.y).to eq(3)
              end
            end
          end

          context 'outside the table boundary' do
            context 'current direction is north' do
              it 'raises PositionOutOfBounds' do
                robot.position = Position.new(2, 4, 0)
                expect { subject.execute }.to raise_error(PositionOutOfBounds)
              end
            end

            context 'current direction is south' do
              it 'raises PositionOutOfBounds' do
                robot.position = Position.new(2, 0, 180)
                expect { subject.execute }.to raise_error(PositionOutOfBounds)
              end
            end

            context 'current direction is east' do
              it 'raises PositionOutOfBounds' do
                robot.position = Position.new(4, 0, 180)
                expect { subject.execute }.to raise_error(PositionOutOfBounds)
              end
            end

            context 'current direction is west' do
              it 'raises PositionOutOfBounds' do
                robot.position = Position.new(0, 0, 270)
                expect { subject.execute }.to raise_error(PositionOutOfBounds)
              end
            end
          end
        end

        context 'robot is not on table' do
          before do
            allow(robot).to receive(:on_table?) { false }
          end

          it 'raises RobotNotOnTable' do
            expect { subject.execute }.to raise_error(RobotNotOnTable)
          end
        end
      end
    end
  end
end
