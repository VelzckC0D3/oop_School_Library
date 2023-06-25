require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize(main_call)
    @main_call = main_call
    @people = []
    @books = []
    @rentals_list = []
  end

  def list_books
    if @books.empty?
      print 'No books available'
    else
      puts '------------------List-of-books-------------------'
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    @main_call.display_menu
  end

  def list_people
    if @people.empty?
      print 'No people available'
    else
      puts '-----------------List-of-People------------------'
      @people.each do |person|
        puts "[#{person.class} Name: #{person.name}, Age: #{person.age}, ID: #{person.id}]"
      end
    end
    @main_call.display_menu
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      print 'Invalid option'
    end
    @main_call.display_menu
  end

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'

    @people.push(Student.new(age, name, parent_permission: parent_permission))
    puts "Person #{name} was created"
  end

  def create_teacher
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    print 'Specialization:'
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    print
    puts "Person #{name} was created"
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "Book #{title} was created"
    @main_call.display_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "List Number: #{index} => Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "List Number: #{index} => [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date of rental: '
    date = gets.chomp
    @rentals_list.push(Rental.new(date, @books[book_index], @people[person_index]))
    puts '--------------------------------------------------'
    puts 'Rental created successfully'
    @main_call.display_menu
  end

  def list_rentals
    print 'Id of the person:'
    person_id = gets.chomp.to_i
    if @rentals_list.empty?
      print 'No rentals asign to that id'
    else
      puts '-----------------List-of-rentals-----------------'
      @rentals_list.each do |rental|
        puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
      end
    end
    @main_call.display_menu
  end

  def quit
    print 'Thank you for using this app!'
  end
end
