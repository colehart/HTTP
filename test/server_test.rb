require './test/test_helper'
require './lib/server'
require 'faraday'

class ServerTest < Minitest::Test
  # works as unit test if no integration tests running
  def test_it_exists
    server = Server.new(9292)
    assert_instance_of Server, server
  end

  # def test_connection_starts_as_nil
  #   skip
  #   server = Faraday.get('http://localhost:9292/')
  #   assert_nil server.connection
  # end
end
