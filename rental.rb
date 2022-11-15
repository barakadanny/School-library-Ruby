class rental
  attr_accessor :book, :person
  attr_reader :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end
end