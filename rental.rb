class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    @book.rentals << self
    
    @person = person
    @person.rentals << self
  end

  def belongs_to
    puts "The book '#{book.title}' belongs to the '#{person.name}' student"
  end
end
