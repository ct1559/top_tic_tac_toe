# Player class to create two players
class Player
  attr_reader :name, :mark
  
  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end