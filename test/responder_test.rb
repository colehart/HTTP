require './test/test_helper'
require './lib/responder'

class ResponderTest < Minitest::Test
  def test_it_exists
    responder = Responder.new
    assert_instance_of Responder, responder
  end

  def test_counter_starts_at_zero
    responder = Responder.new
    assert_equal 0, responder.counter
  end

  def test_request_lines_starts_as_empty_array
    responder = Responder.new
    assert_empty responder.request_lines
  end
=begin
  def test_request_lines_populates
    responder = Responder.new
    responder.populate_request_lines("stuff from server")
    assert_equal "stuff from server", responder.request_lines
  end

  def test_request_lines_populates_differently
    responder = Responder.new
    responder.populate_request_lines("different stuff from server")
    assert_equal "different stuff from server", responder.request_lines
  end
=end
  def test_print_header_returns_header
    responder = Responder.new
    assert_equal ["http/1.1 200 ok"], responder.print_header
  end

  # def test_print_output_returns_output
  #   skip
  #   responder = Responder.new
  #   assert_equal "\n<html><head></head><body></body></html>", responder.print_output
  # end

  def test_counter_increases_by_one_with_each_response
    responder = Responder.new
    responder.count
    assert_equal 1, responder.counter

    responder.count
    assert_equal 2, responder.counter
  end
end
