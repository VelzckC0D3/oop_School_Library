require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :age, :name, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental unless @rentals.include?(rental)
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
