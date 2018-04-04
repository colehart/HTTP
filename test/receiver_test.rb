require 'minitest/autorun'
require 'minitest/pride'
require './lib/receiver.rb'

class ReceiverTest < Minitest::Test
  def test_it_exists
    receiver = Receiver.new(9292)
    assert_instance_of Receiver, receiver
  end
end
