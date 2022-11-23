require_relative '../../rental.rb'
require_relative '../../teacher.rb'
require_relative '../../book.rb'
require 'rspec/autorun' 

describe Book do
    context 'When testing the Rental class' do
      it 'should create a new Rental' do
        teacher = Teacher.new('Biology', 64, 'Muwanika')
        book = Book.new('Biological Science', 'D. J. Taylor')
        rental = Rental.new('2022-11-09', teacher, book)
        expect(rental.book.rental.length).to eq 1
        expect(rental.person.rentals.length).to eq 1
      end
    end
  end