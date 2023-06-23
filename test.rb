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
    each = rental.map { |each_book| each_book.book.title }
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

  def many_rentals
    puts "The book '#{title}' has been rented '#{rentals.length}' time(s)"
  end
end

# Create new students
puts '--------- create new students ---------'
student1 = TestStudent.new(18, 'John Doe')
student2 = TestStudent.new(17, 'Maryanne Smith')
puts ''

# Create a new classroom
puts '--------- create new classroom ---------'
maths = TestClassroom.new('Maths')
spanish = TestClassroom.new('Spanish')
puts ''

# Add student to classroom
puts '--------- add students to classrooms ---------'
student1.student_classroom(maths)
student2.student_classroom(spanish)
puts ''

# Check if student belongs to classroom
puts '--------- student belongs to a classroom? ---------'
student1.belongs_to
student2.belongs_to
puts ''

# How many students does the classroom have?
puts '--------- how many students does the classroom have? ---------'
maths.many?
spanish.many?
puts ''

# Create books
puts '--------- create new books ---------'
years = TestBook.new('100 Years Of Loneliness', 'Gabriel Garcia Marquez')
baldor = TestBook.new('Baldor Mathematics', 'Aurelio Baldor')
lord = TestBook.new('The Lord Of The Rings', 'J. R. R. Tolkien')
puts ''

# Student rents books
puts '--------- student rents books ---------'
student1.add_rental(baldor, '01-15-2023')
student1.add_rental(years, '01-16-2023')
student2.add_rental(lord, '01-20-2023')
puts ''

# How many times the book has been rented?
puts '--------- how many times the book has been rented? ---------'
years.many_rentals
baldor.many_rentals
lord.many_rentals
puts ''

# How many books has the student rented?
puts '--------- how many books has the student rented? ---------'
student1.rentals
student2.rentals
puts ''
