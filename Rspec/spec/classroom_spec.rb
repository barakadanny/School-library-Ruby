require_relative '../../classroom'
require 'rspec/autorun' 
describe Classroom do
  context 'When testing the Classsroom class' do
    it 'should create a new classroom' do
      classroom = Classroom.new('A1')
      expect(classroom.label).to eq 'A1'
    end
  end
end
