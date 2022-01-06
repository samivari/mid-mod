require './lib/vehicle'
require './lib/passenger'
require './lib/intersection'

RSpec.describe do
  it 'has two cross streets' do
    intersection = Intersection.new('Colorado', 'Yale')
    expect(intersection.first_cross_street).to eq('Colorado')
    expect(intersection.second_cross_street).to eq('Yale')
  end

  it 'can list all vehicles that passed through it' do
    intersection = Intersection.new('Colorado', 'Yale')
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    intersection.car_passing(vehicle)
    expect(intersection.passed_cars).to eq([vehicle])
  end

  it 'can list all vehicles that were speeding through it.' do
    intersection = Intersection.new('Colorado', 'Yale')
    honda = Vehicle.new('2001', 'Honda', 'Civic')
    toyota = Vehicle.new('2012', 'Toyota', '4runner')
    honda.speed
    intersection.car_passing(honda)
    intersection.car_passing(toyota)
    expect(intersection.speeding_cars).to eq([honda])
  end

  it 'can list all the drivers that were speeding through it.' do
    intersection = Intersection.new('Colorado', 'Yale')
    honda = Vehicle.new('2001', 'Honda', 'Civic')
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    jude = Passenger.new({ 'name' => 'Jude', 'age' => 20 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    honda.add_passenger(charlie)
    honda.add_passenger(jude)
    honda.add_passenger(taylor)
    charlie.drive
    honda.speed
    toyota = Vehicle.new('2012', 'Toyota', '4runner')
    intersection.car_passing(honda)
    intersection.car_passing(toyota)
    expect(intersection.speeding_drivers).to eq([charlie])
  end
end
