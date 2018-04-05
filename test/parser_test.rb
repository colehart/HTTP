require './test/test_helper'
require './lib/parser'

class ParserTest < Minitest::Test
  def test_it_exists
    parser = Parser.new
    assert_instance_of Parser, parser
  end

  def test_request_lines_starts_as_empty_array
    parser = Parser.new
    assert_empty parser.request_lines
  end

  def test_response_starts_as_empty_string
    parser = Parser.new
    assert_equal "", parser.response
  end

  def test_parse_lines_generates_new_response
    parser = Parser.new
    refute_equal "", parser.parse_lines
  end
=begin
  def test_request_lines_populates
    parser = Parser.new
    parser.populate_request_lines("stuff from server")
    assert_equal "stuff from server", parser.request_lines
  end

  def test_request_lines_populates_differently
    parser = Parser.new
    parser.populate_request_lines("different stuff from server")
    assert_equal "different stuff from server", parser.request_lines
  end
=end
end
