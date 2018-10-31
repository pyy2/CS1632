require 'minitest/autorun'
require_relative 'gold_rush.rb'

class GoldRushTest < Minitest::Test
    # Special method that is run before each test to reuse @v instance
    # variable such that we don't have to type m = GoldRush::new in each test
    def setup
        @g = GoldRush.new(args[1, 1])
    end


end