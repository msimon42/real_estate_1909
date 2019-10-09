require 'minitest/autorun'
require_relative '../lib/house'
require_relative '../lib/room'

class HouseTest < MiniTest::Test

  def setup
    @house = House.new('400000', '123 Sugar Lane')
    @room = Room.new(:bedroom, 10, 13)
  end

  def test_existence
    assert_instance_of House, @house
  end

  def test_add_room
    @house.add_room(@room)

    assert_equal [@room], @house.rooms
  end
end

