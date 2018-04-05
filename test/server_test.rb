require './test/test_helper'
require './lib/server'
require 'faraday'

class ServerTest < Minitest::Test
  # works as unit test if no integration tests running
  def test_it_exists
    server = Server.new(9292)
    assert_instance_of Server, server
  end

  def test_connection_starts_as_nil
    skip
    response = Faraday.get('http://localhost:9292/hello')
    assert_equal "Hello World! (0)."
  end
end
