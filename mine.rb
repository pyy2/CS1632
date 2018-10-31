require_relative 'seed_rand.rb'
# This is the actual simulation class for the gold_rush program
class Mine
  # Gold Rush simulator location constants in a nested hashmap

  PLACE = {
    'Sutter Creek' => {
      'gold' => 3,
      'silver' => 0,
      'connect' => ['Angels Camp', 'Coloma']
    },
    'Coloma' => {
      'gold' => 3,
      'silver' => 0,
      'connect' => ['Sutter Creek', 'Virginia City']
    },
    'Angels Camp' => {
      'gold' => 4,
      'silver' => 0,
      'connect' => ['Sutter Creek', 'Nevada City', 'Virginia City']
    },
    'Nevada City' => {
      'gold' => 5,
      'silver' => 0,
      'connect' => ['Angels Camp']
    },
    'Virginia City' => {
      'gold' => 3,
      'silver' => 3,
      'connect' => ['Angels Camp', 'Coloma', 'Midas', 'El Dorado Canyon']
    },
    'Midas' => {
      'gold' => 0,
      'silver' => 5,
      'connect' => ['Virginia City', 'El Dorado Canyon']
    },
    'El Dorado Canyon' => {
      'gold' => 0,
      'silver' => 10,
      'connect' => ['Virginia City', 'Midas']
    }
  }.freeze

  # Initialization of gold rush simulation
  # 1. Seeds random number generator
  # 2. Sets prospector number
  # 3. Initializes global variables:
  #    days, gold, silver, turn, current location
  # 4. Initialize place hash map
  def initialize(prospector)
    @prospector = prospector
    @days = 0
    @gold = 0
    @silver = 0
    @turns = 0
    @place = PLACE
  end

  # BEGIN SIMULATION

  # Prospector will always start in Sutter Creek. Print Prospector
  # number then send the String Sutter Creek to location to set a location
  def start
    print "Prospector #{@prospector} starting in Sutter Creek.\n"
    location 'Sutter Creek'
  end

  # Sets location and passes back to start_location to look for gold
  # and silver
  def location(new_city)
    start_location new_city
  end

  # Searches location for gold/silver then prints if found or not found
  def start_location(current_location)
    if @turns < 5
      print nothing_found current_location unless found current_location

      # Gets random number from 0 to number of connecting cities
      to_location = find_rand(@place[current_location]['connect'].length - 1)

      # Assigns next connecting city based on rand number
      new_city = @place[current_location]['connect'][to_location]

      # Outputs travel log between cities
      print_travel current_location, new_city
      print_amount_type

      # Increment turns until turns equals 5
      @turns += 1

      # Sets location to next city
      location new_city
    end
  end

  # get pseudo-random number from 0 to max + 1
  def find_rand(max_num)
    rand(max_num + 1)
  end

  def found(current_location)
    # Assign variables for easy use
    gold_found = find_rand(@place[current_location]['gold'])
    silver_found = find_rand(@place[current_location]['silver'])

    # Increment day by 1
    @days += 1

    # Return false if no gold/silver is found
    return false if gold_found.zero? && silver_found.zero?

    # First 3 turns, just return if nothing is found
    # If turn is greater or equal to 3 then it will mean its the
    # last 2 turns so loop only if gold found is greater than 1
    # and silver found is greater than 2 otherwise move on
    if @turns < 3
      gold_found.nonzero? || silver_found.nonzero?
      print_loot gold_found, silver_found, current_location
      add_loot gold_found, silver_found
      found(current_location)
    elsif @turns >= 3 && (gold_found > 1 || silver_found > 2)
      print_loot gold_found, silver_found, current_location
      add_loot gold_found, silver_found
      found(current_location)
    elsif gold_found > 1 || silver_found > 2
      print_loot gold_found, silver_found, current_location
      add_loot gold_found, silver_found
    end
  end

  def add_loot(gold_found, silver_found)
    @gold += gold_found
    @silver += silver_found
  end

  # Prints amount gold and silver found searching the area
  def print_loot(gold_found, silver_found, current_location)
    print "\tFound"
    print_amount 'gold', gold_found unless gold_found.zero?
    print_amount 'silver', silver_found unless silver_found.zero?
    puts " in #{current_location}."
  end

  # Prints message indicating nothing is found in current location
  def nothing_found(current_location)
    puts "\tFound no precious metals in #{current_location}"
  end

  # Prints travel message between locations
  def print_travel(location1, location2)
    print "Heading from #{location1} to #{location2}"
  end

  # Prints amount gold and silver in possession.
  def print_amount_type
    print_amount 'gold', @gold
    print_amount 'silver', @silver
    puts '.'
  end

  # Prints 'ounce' or 'ounces' depending on whether the
  # type of resource is 1 or not
  def is_plural(amount)
    amount == 1 ? ' ounce ' : ' ounces '
  end

  # Prints to STDOUT the amount of resource and type
  def print_amount(type, amount)
    print " #{amount}"
    print is_plural amount
    print "of #{type}"
  end
  
  #gets gold value
  def get_gold
	@gold
  end
  
  #gets silver value
  def get_silver
    @silver
  end

  # Returns the gold total as a floating point
  def calculate_gold_worth
    20.67 * @gold
  end

  # Returns the silver total as a floating point
  def calculate_silver_worth
    1.31 * @silver
  end

  # Calculates the total gold and silver as a floating point
  def total
    calculate_gold_worth + calculate_silver_worth
  end

  # Prints the total gold and silver amount with a $ in front
  def print_total
    puts "\t Heading home with $#{total.round(2)}."
  end

  # Shows the completion of the simulation for N prospector
  def show_results
    puts "After #{@days} days, Prospector #{@prospector} returned to San Francisco with:"
    print "\t"
    print_amount 'gold', @gold
    puts '.'
    print "\t"
    print_amount 'silver', @silver
    puts '.'
    print_total
  end
end
