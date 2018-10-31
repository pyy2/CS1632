require 'minitest/autorun'
require_relative 'mine.rb'

class MineTest < MiniTest::Test

	def setup
        @f = Mine.new(1)
    end

    # UNIT TEST TO CHECK LOCATIONS


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
        assert_nil Mine::PLACE['pluto']
    end

    # Test that the correct adjoining cities can be retrieved from
    # a given location in an array format, if not then fails
    def test_place_max_gold
        assert_equal ['Angels Camp', 'Coloma'], Mine::PLACE['Sutter Creek']['connect']
    end
	
	
	#Test to make sure that method find_rand will not come up with
	#value larger than max+1
	def test_gold_value
		refute_equal 5, @f.find_rand(3)
	end
	
	#Test to make sure gold is calculated properly
	def test_gold_total
		gold_val = 20.67 * @f.get_gold
		assert_equal gold_val, @f.calculate_gold_worth
	end
	
	#Test to make sure silver is calculated properly
	def test_silver_total
		silver_val = 1.31 * @f.get_silver
		assert_equal silver_val, @f.calculate_silver_worth
	end
	
	#Test to make sure that the equal method properly adds up the
	#gold and silver values
	def test_cost_total
		total = @f.calculate_gold_worth + @f.calculate_silver_worth
		assert_equal total, @f.total
	end
	
	#Test to make sure that the ounce only singular if there is only
	#one ounce collected
	def test_ounce_plural
		assert_equal " ounce ", @f.is_plural(1)
	end
	
	
	
	#Could do stub for days and turns if they were methods and not 
	#global variables...
	def test_day_increment
	end
	
	def test_turn_increment
	end
	
	
	
    
    # Test that inputting a string that is not a key will
    # result in nil.
    def test_place_not_listed
        assert_nil Mine::PLACE['Pluto']
    end

end