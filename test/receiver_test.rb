require 'minitest/autorun'
require 'minitest/pride'
require './lib/receiver.rb'

class ReceiverTest < Minitest::Test
  def test_it_exists
    receiver = Receiver.new(9292)
    assert_instance_of Receiver, receiver
  end

  def test_connection_starts_as_nil
    receiver = Receiver.new(9292)
    assert_nil receiver.connection
  end

  def test_request_lines_starts_as_empty_array
    receiver = Receiver.new(9292)
    assert_empty receiver.request_lines
  end
end
