require 'minitest/autorun'
require_relative 'gold_rush'

class GoldRushTest < Minitest::Test

    def setup
        @g = gold_rush::new
    end
    
    # UNIT TESTS FOR METHOD arguments
    # Equivalence classes:
    # x= -INFINITY..-1 -> returns -x
    # x= 0..INFINITY -> returns x
    # x= (not a number) -> returns nil

    # If a negative value is given for x, then -x is returned.
    def test_seed_negative_val
        assert_equal 1, absolute_value(-1)
    end
    
    # If a positive value is given for x, then x is returned.
    def test_seed_positive_val
        assert_equal 1, absolute_value(1)
    end
    
    # If an invalid value, such as a string, is given for x,
    # then nil is returned.
    # EDGE CASE
    def test_seed_invalid_val
        assert_nil absolute_value("poodle")
    end

    # UNIT TESTS FOR METHOD argument(x)
    # Equivalence classes:
    # x= -INFINITY..-1 -> returns -x
    # x= 0..INFINITY -> returns x
    # x= (not a number) -> returns nil

    # If a negative value is given for x, then -x is returned.
    def test_seed_negative_val
        assert_equal 1, absolute_value(-1)
    end
    
    # If a positive value is given for x, then x is returned.
    def test_seed_positive_val
        assert_equal 1, absolute_value(1)
    end
    
    # If an invalid value, such as a string, is given for x,
    # then nil is returned.
    # EDGE CASE
    def test_seed_invalid_val
        assert_nil absolute_value("poodle")
    end
end