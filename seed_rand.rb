# This is the random number seed for the mine.rb program
class Seed
  def initialize(seed)
    srand(seed)
  rescue ArgumentError
  end
end
