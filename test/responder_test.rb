require './test/test_helper'
require './lib/responder'

class ResponderTest < Minitest::Test
  def test_it_exists
    responder = Responder.new
    assert_instance_of Responder, responder
  end

  def test_request_lines_starts_as_empty_array
    responder = Responder.new
    assert_empty responder.request_lines
  end

  def test_hello_counter_starts_at_zero
    responder = Responder.new
    assert_equal 0, responder.hello_counter
  end

  def test_total_counter_starts_at_zero
    responder = Responder.new
    assert_equal 0, responder.total_counter
  end

  def test_print_header_returns_header
    responder = Responder.new
    assert_equal ["http/1.1 200 ok"], responder.print_header
  end

  def test_hello_counter_increases_by_one_with_each_response
    responder = Responder.new
    responder.count_hello
    assert_equal 1, responder.hello_counter

    responder.count_hello
    assert_equal 2, responder.hello_counter
  end

  def test_total_counter_increases_by_one_with_each_response
    responder = Responder.new
    responder.count_total
    assert_equal 1, responder.total_counter

    responder.count_total
    assert_equal 2, responder.total_counter
  end
end
