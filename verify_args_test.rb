require 'minitest/autorun'
require_relative 'verify_args.rb'

class ValidArgsTest < MiniTest::Test

    # Special method that is run before each test to reuse @v instance
    # variable such that we don't have to type m = GoldRush::new in each test
    def setup
        @v = VerifyArgs.new
    end

    # UNIT TESTS FOR METHOD verify_args(args)
    # Equivalence classes:
    # @v = [-INFINITY..-1,-INFINITY..-1] -> returns false
    # @v = [-INFINITY..INFINITY,1..INFINITY] -> returns true
    # @v = (not a number) -> returns false
  
    # If there are no command line arguments then
    # false is returned
    def test_verify_args_no_args
        assert_equal false, @v.verify_args([])
    end

    # If there is only 1 command line argument, then
    # false is returned
    def test_verify_args_one_arg
        assert_equal false, @v.verify_args([1])
        assert_equal false, @v.verify_args(['hi'])
    end
  
    # If there are 2 string arguments, then
    # false is returned
    # EDGE CASE
    def test_verify_args_two_string_args
        assert_equal false, @v.verify_args(['a', 'b'])
    end
  
    # If there is 1 string and 1 integer argument, then
    # false is returned
    # EDGE CASE
    def test_verify_args_one_string_one_int
        assert_equal false, @v.verify_args(['a', 1])
        assert_equal false, @v.verify_args([1, 'b'])
    end
  
    # If the second argument is a negative integer, then
    # false is returned
    def test_verify_args_negative_second_args
        assert_equal false, @v.verify_args([0, -2])
        assert_equal false, @v.verify_args([-1, -2])
    end

    # If there are 2 integer arguments with the second
    # argument as a non-negative integer, then true is returned
    def test_verify_args_valid
        assert_equal true, @v.verify_args([1, 10])
    end
end
