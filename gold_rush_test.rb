require 'minitest/autorun'
require_relative 'gold_rush'

#TODO-
#This is just a Black Box listing of all the major points that need to be hit.
#Could not make whit box because incomplete program/difficult to trace.
#Will become more white box once the program is fine tuned, can just modify...
#currently requirement based tests to method based tests.


class GoldRushTest < Minitest::Test

    def setup
        @g = gold_rush::new
    end
	
#---------------------------------------------------------

	#UNIT TESTS FOR METHOD check_args(args)
	
	#If there are not two arguments, returns false
    def test_number_of_arguments
    end

	#If intiger is input for both args, returns true
    def test_int_argument
    end

	#If prospectors arg is non-negative int, return false
    def test_prospector_argument
    end

#-----------------------------------------------------------	
	
	#UNIT TESTS FOR DISPLAYING MESSAGES
	
	#If check_args returns false, show_usage_and_exit
	def test_false_args
	end
	
	#If gold found, display message with how much and location
	def test_gold_message
	end
	
	#If silver found, display message with how much and location
	def test_silver_message
	end
	
	#If no metals found, display message saying no metals found
	def test_none_message
	end
	
	#If moving locations, display message saying new location and metals currently held
	def test_moving_message
	end
	
	#If done travelling, display message saying length of travel and prospector #
	def test_end_message
	end
	
	#If done travelling, print final gold tally in ounces
	def test_end_gold_message
	end
	
	#If done travelling, print final silver tally in ounces
	def test_end_silver_message
	end
	
	#Edge Case
	#If singular ounce of metal, use "ounce", otherwise use "ounces"
	def test_end_message_singular
	end
	
	#If printing money, begin with dollar sign
	def test_money_sign
	end
	
#-----------------------------------------------------------
	
	#UNIT TESTS FOR GOLD
	
	#If random generator is less than or equal to  max gold for location
	def test_gold_rand_generator
	end
	
	#If gold found in first three locations, stay at location
    def test_gold_found_early
    end
	
	#If 2 or more gold found in final two locations, stay at location
	def test_gold_found_late
	end
	
	#If new prospector, must reset gold amount
	def test_reset_gold
	end
	
#------------------------------------------------------------
	
	#UNIT TESTS FOR SILVER
	
	#If random generator is less than or equal to max silver for location
	def test_silver_rand_generator
	end
	
	#If silver found in first three locations, stay at location
    def test_silver_found_early
    end

	#If 3 or more silver found in final three locations, stay at location
	def test_silver_found_late
	end
	
	#If new prospector, must reset silver amount
	def test_reset_silver
	end
	
#-------------------------------------------------------------
	
	#UNIT TESTS FOR LOCATIONS
	
	#If prospector starts in Sutter Creek
    def test_start_location
    end
	
	#If prospector travels, must be to connected location
	def test_travel_connect
	end
	
	#If new prospector, must reset location to Sutter Creek
	def test_reset_location
	end
	
#---------------------------------------------------------------

	#GENERAL UNIT TESTS
	
	#If done travelling, calculate total money earned using gold and silver totals to nearest cent
	def test_done_calculate_money
	end
	
	#If done travelling with a prospector, iterate to next if applicable
	def test_next_prospector
	end
	
	#If travelled 4 times (been to 5 locations including repeats, req. 9) will not travel again
	def test_done_travelling
	end
	
	#If new prospector, must reset travel amount
	def test_reset_travel
	end
	
#---------------------------------------------------------------	
    
end