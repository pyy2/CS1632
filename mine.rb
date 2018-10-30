# This is the actual simulation class for gold_rush program
class Mine
  PLACE = [
    { location: 'Sutter Creek', silver: 0, gold: 2 },
    { location: 'Coloma', silver: 0, gold: 3 },
    { location: 'Angels Camp', silver: 0, gold: 4 },
    { location: 'Nevada City', silver: 0, gold: 5 },
    { location: 'Virginia City', silver: 3, gold: 3 },
    { location: 'Midas', silver: 5, gold: 0 },
    { location: 'El Dorado Cn', silver: 10, gold: 0 }
  ].freeze

  # Initialization of gold rush simulation
  # Create a new blank board and have the X_PLAYER start the game
  def initialize(seed, prospector)
    seed_rand_generator seed
    @prospector = prospector
  end

  # Seeds the random number generator from the first argument
  def seed_rand_generator(seed)
    srand seed
  end

  # BEGIN SIMULATION
  def start
    print start_location
    5.times do |x|
      # if mine_area?
      #     add_loot
      # else
      #     move_location
      # end
    end
    # debugging
    travel 'hi', 'bye', 2, 1
    show_results 1, 2
  end

  def mine_area?
    false
  end

  # Print start location of prospector
  def start_location
    "Prospector #{@prospector} starting in Sutter Creek."
  end

  # Prints travel message between locations with amount found
  def travel(location1, location2, gold, silver)
    print "Heading from #{location1} to #{location2}"

    if gold > 0 || silver > 0
      print ', holding '
    end

    print_amount 'gold', gold

    if gold > 0 && silver > 0
      print ' and '
    end

    print_amount 'silver', silver
    puts '.'
  end

  # Searches location for
  def search_location
    puts 'hi'
  end

  def print_plural(metal)
    print metal == 1 ? ' ounce ' : ' ounces '
  end

  def print_amount(name, amount)
    if amount > 0
      print amount
      print_plural amount
      print "of #{name}"
    end
  end

  def print_total(gold, silver)
    net_gold = 20.67 * gold
    net_silver = 1.31 * silver
    total = net_gold + net_silver
    puts "\tHeading home with $#{total.round(2)}."
  end

  def show_results(gold, silver)
    puts "After 15 days, Prospector #{@prospector} returned to San Francisco with:"
    print "\t"
    print_amount 'gold', gold
    puts '.'
    print "\t"
    print_amount 'silver', silver
    puts '.'
    print_total gold, silver
  end
end
