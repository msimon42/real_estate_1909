require_relative 'room'

class House
  attr_reader :price, :address, :rooms

  def initialize(price, address, rooms=Array.new)
    @price = price
    @address = address
    @rooms = rooms
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category == category.to_sym}
  end

  def area
    @rooms.collect { |room| room.area }.reduce(0, :+)
  end

  def price_per_sf
    (self.price.to_f / self.area.to_f).round(2)
  end

  def sort_by_area
    @rooms.sort_by {|room| room.area}
  end

  def rooms_by_category
    categories = @rooms.uniq {|room| room.category}.map {|room| room.category}
    result = Hash[categories.collect {|cat| [cat, Array.new]}]
    categories.each do |cat|
      result[cat] = self.rooms_from_category(cat)
    end
    result
  end
end

# house = House.new('400000', '123 Sugar Lane') #130, 240, 500, 221
# room1 = Room.new(:bedroom, 10, 13)
# room2 = Room.new(:bedroom, 15, 16)
# room3 = Room.new(:living_room, 20, 25)
# room4 = Room.new(:kitchen, 17, 13)
#
# house.add_room(room1)
# house.add_room(room2)
# house.add_room(room3)
# house.add_room(room4)
#
# p house.rooms_by_category