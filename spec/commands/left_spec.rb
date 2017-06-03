require 'spec_helper'

module ToyRobot
  module Commands
    describe Left do
      let(:robot) { double(on_table?: true, position: double(bearing: bearing)) }
      let(:table) { double }

      subject { described_class.new(robot, table) }

      describe '#execute' do
        context 'bearing is 0' do
          let(:bearing) { 0 }

          it 'updates the bearing to 270' do
            expect(robot.position).to receive(:bearing=).with(270)
            subject.execute
          end
        end

        context 'bearing is 90' do
          let(:bearing) { 90 }

          it 'updates the bearing to 0' do
            expect(robot.position).to receive(:bearing=).with(0)
            subject.execute
          end
        end

        context 'bearing is 180' do
          let(:bearing) { 180 }

          it 'updates the bearing to 90' do
            expect(robot.position).to receive(:bearing=).with(90)
            subject.execute
          end
        end

        context 'bearing is 270' do
          let(:bearing) { 270 }

          it 'updates the bearing to 180' do
            expect(robot.position).to receive(:bearing=).with(180)
            subject.execute
          end
        end
      end
    end
  end
end
