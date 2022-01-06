class NationalPark
  attr_reader :name, :price, :vehicles, :passengers

  def initialize(name, price)
    @name = name
    @price = price
    @vehicles = []
    @passengers = []
  end

  def vehicles_entered(vehicle)
    vehicles << vehicle
  end

  def passengers_entered
    vehicles.each do |vehicle|
      @passengers << vehicle.passengers
    end
    @passengers.flatten!
  end

  def revenue
    adults = passengers.find_all do |passenger|
      passenger.adult?
    end
    adults.count * @price
  end
end
