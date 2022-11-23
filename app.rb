require './person'
require './student'
require './teacher'
require './book'
require './classroom'
require './rental'
require './persist'


class App
  def initialize
    @persist_person= Persist.new('person.json')
    @persist_books = Persist.new('book.json')
    @persist_rentals = Persist.new('rental.json')
    @books = []
    @persons = []
    @rentals = []
  end

  def start_console
    puts 'School Library!'
    until list_of_options
      input = gets.chomp
      if input == '7'
        puts 'Thank You for using my School Library!'
        break
      end

      option input
    end
  end

  def list_all_books
    puts 'No Book available!' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_persons
    puts 'No person available in the DataBase' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again'
    end
  end

  def permission?
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp

    case permission.downcase
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid input'
      permission?
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    parent_permission = permission?
    student = Student.new(age, name, parent_permission)
    @persons.push(student)
    save = @persist_person.load

    @persons.each do |person|
      save << { name: person.name, id: person.id, age: person.age }
    end
    save_student = Persist.new('person.json')
    save_student.save(save)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Create a new teacher'
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @persons << teacher

    save = @persist_person.load
    @persons.each do |person|
      save << { name: person.name, id: person.id, age: person.age }
    end
    save_teacher = Persist.new('person.json')
    save_teacher.save(save)
    puts 'Teacher created successfully'
  end

  def create_book()
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)

    save = @persist_books.load
    @books.each do |b|
      save << { title: b.title, author: b.author }
    end
    save_book = Persist.new('book.json')
    save_book.save(save)
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @persons[person_id], @books[book_id])
    @rentals << rental

    save = @persist_rentals.load
    @rentals.each do |rent|
      save << { date: rent.date, book: { title: rent.book['title'], author: rent.book['author'] }, person: {
        id: rent.person['id'],
        name: rent.person['name'],
        age: rent.person['age']
      } }
    end
    save_rental = Persist.new('rental.json')
    save_rental.save(save)
    puts 'Rental created successfully'
  end

  def list_all_rentals
    puts 'To see person rentals enter the person ID: '
    @persons.each do |person|
      puts "id: #{person.id}"
    end
    id = gets.chomp.to_i
    puts 'Rented Books:'
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Peson: #{rental.person.name}  Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts
        puts 'No records where found for the given ID'
      end
    end
  end
end
