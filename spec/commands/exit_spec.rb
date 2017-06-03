require 'spec_helper'

module ToyRobot
  module Commands
    describe Exit do
      let(:robot) { double }
      let(:table) { double }

      subject { described_class.new(robot, table) }

      describe '#execute' do
        it 'throws :exit' do
          expect(STDOUT).to receive(:puts)
          expect { subject.execute }.to throw_symbol(:exit)
        end
      end
    end
  end
end
