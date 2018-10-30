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
      'silver' => 0
    },
    'Angels Camp' => {
      'gold' => 4,
      'silver' => 0
    },
    'Nevada City' => {
      'gold' => 5,
      'silver' => 0
    },
    'Virginia City' => {
      'gold' => 3,
      'silver' => 3
    },
    'Midas' => {
      'gold' => 0,
      'silver' => 5
    },
    'El Dorado Cn' => {
      'gold' => 0,
      'silver' => 10
    }
  }.freeze

  # Initialization of gold rush simulation
  # 1. Seeds random number generator
  # 2. Sets prospector number
  # 3. Initializes global variables days, gold, silver, current location
  # 4. Initialize place hash map
  def initialize(seed, prospector)
    seed_rand_generator seed
    @prospector = prospector
    @days = 0
    @gold = 0
    @silver = 0
    @place = PLACE
  end

  # Seeds the random number generator from the first command-line argument
  def seed_rand_generator(seed)
    srand seed
  end

  # BEGIN SIMULATION

  # Print start location of prospector
  def start
    print "Prospector #{@prospector} starting in Sutter Creek.\n"
    start_location 'Sutter Creek'
  end

  def start_location(current_location)

    5.times do |x|
      if mine_area?
        print "\tFound "
        print @place[current_location]['gold']
        puts " ounces of gold in #{current_location}"
      end

      travel 'hi', 'bye', 2, 1
    end
    # debugging
    show_results 1, 2
  end

  def mine_area?
    true
  end

  # Prints travel message between locations with amount
  # of gold and silver in possession.
  def travel(location1, location2, gold, silver)
    print "Heading from #{location1} to #{location2}"
    print_amount 'gold', gold
    print_amount 'silver', silver
    puts '.'
  end

  # Searches location for
  def search_location
    puts 'hi'
  end

  def print_plural(amount)
    print amount == 1 ? ' ounce ' : ' ounces '
  end

  def print_amount(name, amount)
    print "#{amount}"
    print_plural amount
    print "of #{name}"
  end

  def print_total(gold, silver)
    net_gold = 20.67 * gold
    net_silver = 1.31 * silver
    total = net_gold + net_silver
    puts "\tHeading home with $#{total.round(2)}."
  end

  def show_results(gold, silver)
    puts "After #{@days} days, Prospector #{@prospector} returned to San Francisco with:"
    print "\t"
    print_amount 'gold', gold
    puts '.'
    print "\t"
    print_amount 'silver', silver
    puts '.'
    print_total gold, silver
  end
end
