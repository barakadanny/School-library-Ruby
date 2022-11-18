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
end