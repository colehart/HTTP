require 'minitest/autorun'
require 'minitest/pride'
require './lib/responder.rb'

class ResponderTest < Minitest::Test
  def test_it_exists
    responder = Responder.new
    assert_instance_of Responder, responder
  end
end
