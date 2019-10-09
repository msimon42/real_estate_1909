require 'minitest/autorun'
require_relative '../lib/house'
require_relative '../lib/room'

class HouseTest < MiniTest::Test

  def setup
    @house = House.new('400000', '123 Sugar Lane') #130, 240, 500, 221
    @room1 = Room.new(:bedroom, 10, 13)
    @room2 = Room.new(:bedroom, 15, 16)
    @room3 = Room.new(:living_room, 20, 25)
    @room4 = Room.new(:kitchen, 17, 13)
  end

  def test_existence
    assert_instance_of House, @house
  end

  def test_add_room
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal [@room1, @room2, @room3, @room4], @house.rooms
  end

  def test_find_rooms_from_cat
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal [@room1, @room2], @house.rooms_from_category('bedroom')
  end

  def test_area
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal 1091, @house.area
  end

  def test_price_per_sf
    @house.add_room(@room1)
    @house.add_room(@room2)
    @house.add_room(@room3)
    @house.add_room(@room4)

    assert_equal 366.64, @house.price_per_sf
  end
end

