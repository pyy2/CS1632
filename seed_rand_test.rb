require 'minitest/autorun'
require_relative 'seed_rand.rb'

class SeedRandTest < MiniTest::Test

    # UNIT TEST FOR METHOD srand(args)
    # Equivalence classes:
    # arg = [-INFINITY..INFINITY..] -> returns true
  
    # verifies that seeding the random number generator
    # it is not nil.
    def test_rand_seed_generator
        seed = Seed.new 1
        refute_nil seed
    end
end