require 'minitest/autorun'
require 'minitest/pride'
require './lib/server.rb'

class ServerTest < Minitest::Test
  def test_it_exists
    server = Server.new(9292)
    assert_instance_of Server, server
  end

  def test_connection_starts_as_nil
    server = Server.new(9292)
    assert_nil server.connection
  end

  def test_request_lines_starts_as_empty_array
    server = Server.new(9292)
    assert_empty server.request_lines
  end
end
