require 'spec_helper'

module ToyRobot
  module Commands
    describe Report do
      let(:robot) { double(on_table?: true, position: double(to_s: '0,4,NORTH')) }
      let(:table) { double }

      subject { described_class.new(robot, table) }

      describe '#execute' do
        it 'prints out current position' do
          expect(STDOUT).to receive(:puts).with('0,4,NORTH')
          subject.execute
        end
      end
    end
  end
end
