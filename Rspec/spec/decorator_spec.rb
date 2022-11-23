require_relative './../../decorator'
require_relative './../../person'

describe Decorator do
  context 'When testing the Decorator class' do
    it 'should create a new decorator when Decorator class is instantiated' do
      p = Person.new(25, 'SammyStevenson')
      decorator = TrimmerDecorator.new(p)
      expect(decorator.correct_name).to eq 'SammySteve'
    end
  end

  context 'When testing the Decorator class' do
    it 'should create a new decorator when Decorator class is instantiated' do
      p = Person.new(25, 'sammy')
      decorator = CapitalizeDecorator.new(p)
      expect(decorator.correct_name).to eq 'Sammy'
    end
  end
end
