# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"
gem "minitest"


require 'minitest/autorun'
require './property'

class TestProperty < Minitest::Test
  def test_addition
    property = Property.new
    assert_equal 4, property.add(Studio, Chicago, 1200), "Search failed"
  end
end
