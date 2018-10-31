require 'minitest/autorun'
require_relative 'mine.rb'

class MineTest < MiniTest::Test

    # UNIT TEST TO CHECK LOCATIONS

    # Test to make sure that constant PLACE is not null
    def test_places_are_not_empty
        refute_nil Mine::PLACE
    end

    # Test that the specified locations is included in the hash to be
    # able to use, if one is not found, then test fails
    def test_places_included
        assert_includes Mine::PLACE, 'Coloma'
    end
    
end