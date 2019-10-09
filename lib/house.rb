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
    rooms_cat = @rooms.find_all {|room| room.category == category.to_sym}
  end

  def area
    area = @rooms.collect { |room| room.area }.reduce(0, :+)
  end

  def price_per_sf
    self.price.to_f / self.area.to_f
  end
end
