require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name = name[0..9] if name.length > 10
    name
  end
end
