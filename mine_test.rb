require 'minitest/autorun'
require_relative 'mine.rb'

class MineTest < MiniTest::Test

	def setup
        @f = Mine.new(1)
    end

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
	
	
	#Test to make sure that method find_rand will not come up with
	#value larger than max+1
	def test_gold_value
		refute_equal 5, @f.find_rand(3)
	end
	
	def test_ounce_plural
		assert_equal " ounce ", @f.is_plural(1)
	end
	
	
    
end