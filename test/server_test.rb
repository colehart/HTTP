require 'minitest/autorun'
require 'minitest/pride'
require './lib/server'

class ServerTest < Minitest::Test
  def test_it_exists
    server = Server.new(9292)
    assert_instance_of Server, server
  end

  def test_connection_starts_as_nil
    skip
    server = Server.new(9292)
    assert_nil server.connection
    # Faraday.new(:get, localhost(9292))
  end


end
