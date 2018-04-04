require 'minitest/autorun'
require 'minitest/pride'
require './lib/responder.rb'

class ResponderTest < Minitest::Test
  def test_it_exists
    responder = Responder.new
    assert_instance_of Responder, responder
  end

  def test_counter_starts_at_zero
    responder = Responder.new
    assert_equal 0, responder.counter
  end

  def test_counter_increases_by_one_with_each_response
    responder = Responder.new
    responder.respond
    assert_equal 1, responder.counter

    responder.respond
    assert_equal 2, responder.counter
  end
end
