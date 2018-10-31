require 'minitest/autorun'
require_relative 'gold_rush'

class GoldRushTest < Minitest::Test

  # Special method that is run before each test to reuse @m instance
  # variable such that we don't have to type m = GoldRush::new in each test
  def setup
    @m = GoldRush::new
  end

  # UNIT TESTS FOR METHOD arguments
  # Equivalence classes:
  # x= -INFINITY..-1 -> returns -x
  # x= 0..INFINITY -> returns x
  # x= (not a number) -> returns nil
  # If a negative value is given for x, then -x is returned.
  def test_negative_val
    assert_equal 1, absolute_value(-1)
  end
  
  # If a positive value is given for x, then x is returned.
  def test_positive_val
    assert_equal 1, absolute_value(1)
  end
  
  # If an invalid value, such as a string, is given for x,
  # then nil is returned.
  # EDGE CASE
  def test_invalid_val
    assert_nil absolute_value("poodle")
  end

  def test_number_of_arguments
  end

  def test_seed_argument
  end

  def test_prospector_argument
  end

  def test_start_location
  end

  def test_gold_found
  end

  def test_rand_generator
  end
end