require_relative '../../teacher'
require_relative '../../book'
require_relative '../../rental'
require 'rspec/autorun' 
describe Teacher do
  before :each do
    @teacher1 = Teacher.new('Maths', 23, 'Sam')
    @teacher2 = Teacher.new('English', 23, 'Dan')
    @book = Book.new('Hello', 'World')
  end
  
  it 'should display teacher name' do
    expect(@teacher1.name).to eq 'Sam'
    expect(@teacher2.name).to eq 'Dan'
  end
end
