class Intersection
  attr_reader :first_cross_street, :second_cross_street, :passed_cars, :speeding_cars

  def initialize(first_cross_street, second_cross_street)
    @first_cross_street = first_cross_street
    @second_cross_street = second_cross_street
    @passed_cars = []
  end

  def car_passing(vehicle)
    passed_cars << vehicle
  end

  def speeding_cars
    passed_cars.find_all do |vehicle|
      vehicle.speeding? == true
    end
  end

  def speeding_drivers
    drivers = []
    speeding_cars.each do |vehicle|
      vehicle.passengers.each do |passenger|
        drivers << passenger if passenger.driver == true
      end
    end
    drivers
  end
end
