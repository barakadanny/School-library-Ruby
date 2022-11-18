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

  def list_persons
    puts 'there is no person!' if @persons.empty?
    @persons.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a Teacher (2)? [Input the number]: '
    person_type = gets.chom
    
    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
    end
  end

  def create_student
    puts 'Create new Student'
    Print 'Enter Age: '
    age = gets.chomp.to_i
    print 'Enter Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      @persons << student
      puts 'Student does not have permission'
    when 'y'
      student = Student.new(age, name, parent_permission: true)
      @persons << student
      puts 'Student has permission'
  end
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
    puts "Book #{title} created successfully."
  end
  