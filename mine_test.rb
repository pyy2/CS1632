require 'minitest/autorun'
require_relative 'mine.rb'

class MineTest < MiniTest::Test

    # UNIT TEST TO CHECK INFORMATION ABOUT LOCATIONS


    # Test to make sure that constant PLACE is not nil
    def test_places_are_not_empty
        refute_nil Mine::PLACE
    end

    # Test that the specified locations is included in the hash to be
    # able to use, if one is not found, then test fails
    def test_places_included
        assert_includes Mine::PLACE, 'Coloma'
    end

    # Test that the max amount of gold can be retrieved from the location
    def test_place_max_gold
        assert_equal 3, Mine::PLACE['Sutter Creek']['gold']
    end

    # Test that the correct adjoining cities can be retrieved from
    # a given location in an array format, if not then fails
    def test_place_max_gold
        assert_equal ['Angels Camp', 'Coloma'], Mine::PLACE['Sutter Creek']['connect']
    end
    
    # Test that inputting a string that is not a key will
    # result in nil.
    def test_place_not_listed
        assert_nil Mine::PLACE['Pluto']
    end

end