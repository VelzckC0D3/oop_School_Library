require_relative 'student'
require_relative 'classroom'
require_relative 'book'

# Student Testing
class TestStudent < Student
  def initialize(age, name = 'Unknown', classroom: nil, parent_permission: true)
    super(age, name, classroom: classroom, parent_permission: parent_permission)
    puts "The student '#{name}' has been added"
  end

  def student_classroom(classroom)
    super(classroom)
    puts "The student '#{name}' has been added to the '#{classroom.label}' class"
  end

  def belongs_to
    puts "The student '#{name}' belongs to the '#{classroom.label}' class"
  end

  def add_rental(book, date)
    super(book, date)
    puts "The student '#{name}' has rented the book '#{book.title}' on '#{date}'"
  end

  def rentals
    rental = @rentals
    each = rental.map { |rental| rental.book.title }
    puts "The student '#{name}' has rented '#{rental.length}' book(s) & those are the following: #{each}"
  end
end

# Classroom Testing
class TestClassroom < Classroom
  def initialize(label)
    super(label)
    puts "The '#{label}' class has been created"
  end

  def add_student(student)
    super(student)
    puts "The student '#{student.name}' has been added to the '#{label}' class"
  end

  def many?
    puts "The '#{label}' class has '#{students.length}' student(s)"
  end
end

# Book Testing
class TestBook < Book
  def initialize(title, author)
    super(title, author)
    puts "The book '#{title}' has been added"
  end

  def add_rental(person, date)
    super(person, date)
    puts "The book '#{title}' has been added to '#{person.name}' rentals on '#{date}'"
  end
end

# Rentals Testing
class TestRental < Rental
  def initialize(date, book, person)
    super(date, book, person)
    puts "The book '#{book.title}' has been rented by '#{person.name}' on '#{date}'"
  end

  def belongs_to
    puts "The book '#{book.title}' has been rented by '#{person.name}' on '#{date}'"
  end
end

# Create a new student
student = TestStudent.new(18, 'John Doe')

# Create a new classroom
maths = TestClassroom.new('Maths')

# Add student to classroom
student.student_classroom(maths)

# Check if student belongs to classroom
student.belongs_to

# How many students does the classroom have?
maths.many?

# Create a new book
book_1 = TestBook.new('100 Years Of Loneliness', 'Gabriel Garcia Marquez')
book = TestBook.new('Baldor Mathematics', 'Aurelio Baldor')

# Add rental to book
book_1.add_rental(student, '2021-01-01')

# Student rents a book
student.add_rental(book, '2021-01-01')

# Student rentals
student.rentals

# How many times the book has been rented?
book_1.many_rentals
book.many_rentals