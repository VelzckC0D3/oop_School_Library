class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :age, :name

  def can_use_services?
    @parent_permission || of_age?
  end

  # TESTING PURPOSES #
  def permission
    can_use_services? ? 'Allowed' : 'Not allowed'
  end

  def showcase
    puts "My name is #{@name} and I am #{@age} years old, I'm #{permission} to use the services"
  end
  # TESTING PURPOSES #

  private

  def of_age?
    @age >= 18
  end
end

# TESTING PURPOSES #
test1 = Person.new(18, 'John', parent_permission: false)
test1.showcase
# TESTING PURPOSES #
