require './person'
require './book'
require './rental'
require './teacher'
require './student'
require './classroom'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'there is no Books!' if @books.empty?
    @books.each { |book| puts "[Book] Title : #{book.title}, Author : #{book.author}" }
  end

  def list_people
    puts 'there is no person!' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end
end