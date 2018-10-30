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

    # Initialize variables
    max_gold = @place[current_location]['gold']
    max_silver = @place[current_location]['silver']
    connecting_cities = @place[current_location]['connect']

    # Visit 5 cities
    3.times do |x|
      gold_found, silver_found = found max_gold, max_silver
      puts "\t" + gold_found.to_s
      puts "\t" + silver_found.to_s
    #   if 
        # puts connecting_cities
        # print "\tFound "
        # print @place[current_location]['connect'][0]
        # puts " ounces of gold in #{current_location}"
    #   else
        print nothing_found current_location
    #   end

      @days += 1
      travel 'hi', 'bye', 2, 1
    end
    # debugging
    # show_results 1, 2
  end

  def found(max_gold, max_silver)
    return rand(max_gold), rand(max_silver)
  end
  
  def nothing_found(current_location)
    puts "\tFound no precious metals in #{current_location}"
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
