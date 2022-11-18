require './app'

def main
  app = App.new
  app.start_console
end

def list_of_options
  puts 'Please choose an option by entering a number:'
  puts '1 - List books'
  puts '2 - List people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end