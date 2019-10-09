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
end
