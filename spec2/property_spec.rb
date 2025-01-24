# tests/test_calculator.rb

require 'minitest/autorun'
require './property'

class TestProperty < Minitest::Test
  def test_addition
    property = Property.new
    assert_equal 4, calculator.add(2, 2), "Addition method failed"
  end
end
