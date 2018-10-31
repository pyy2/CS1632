require 'minitest/autorun'
require_relative 'mine.rb'

class MineTest < MiniTest::Test

    # Special method that is run before each test to reuse @m instance
    # variable such that we don't have to type m = Mine.new in each test
    def setup
        @m = Mine.new 1
    end

    # UNIT TESTS FOR METHOD to check location constant
    # Equivalence classes:

    def test_places_are_not_empty
        refute_nil Mine::PLACE
    end

end