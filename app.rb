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
end