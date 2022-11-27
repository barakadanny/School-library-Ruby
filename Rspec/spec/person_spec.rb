require_relative '../../person'
require 'rspec/autorun'
describe Person do
  context 'When testing the Person class' do
    it 'should create a new person' do
      person = Person.new(19, 'William')
      id = person.id
      expect(person.age).to eq 19
      expect(person.name).to eq 'William'
      expect(person.id).to eq id
    end
  end
end
