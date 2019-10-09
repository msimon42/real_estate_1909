
require 'minitest/autorun'
require_relative '../lib/room'

class RoomTest < MiniTest::Test
  def setup
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_existence
    assert_instance_of Room, @room
  end
end
