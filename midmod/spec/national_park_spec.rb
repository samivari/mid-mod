require './lib/vehicle'
require './lib/passenger'
require './lib/national_park'

RSpec.describe do
  it 'has a name' do
    national_park = NationalPark.new('Black Canyon', 25)
    expect(national_park.name).to eq('Black Canyon')
  end

  it 'has an entry price' do
    national_park = NationalPark.new('Black Canyon', 25)
    expect(national_park.price).to eq(25)
  end

  it 'can list the vehicles that enter the park' do
    national_park = NationalPark.new('Black Canyon', 25)
    honda = Vehicle.new('2001', 'Honda', 'Civic')
    toyota = Vehicle.new('2012', 'Toyota', '4runner')
    national_park.vehicles_entered(honda)
    national_park.vehicles_entered(toyota)
    expect(national_park.vehicles).to eq([honda, toyota])
  end

  it 'can list the passengers that enter the park' do
    national_park = NationalPark.new('Black Canyon', 25)
    honda = Vehicle.new('2001', 'Honda', 'Civic')
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    jude = Passenger.new({ 'name' => 'Jude', 'age' => 20 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    honda.add_passenger(charlie)
    honda.add_passenger(jude)
    honda.add_passenger(taylor)
    national_park.vehicles_entered(honda)
    toyota = Vehicle.new('2012', 'Toyota', '4runner')
    sam = Passenger.new({ 'name' => 'Sam', 'age' => 23 })
    grace = Passenger.new({ 'name' => 'Grace', 'age' => 25 })
    elise = Passenger.new({ 'name' => 'Elise', 'age' => 26 })
    toyota.add_passenger(sam)
    toyota.add_passenger(grace)
    toyota.add_passenger(elise)
    national_park.vehicles_entered(toyota)
    national_park.passengers_entered
    expect(national_park.passengers).to eq([charlie, jude, taylor, sam, grace, elise])
  end

  it 'can calculate revenue generated' do
    national_park = NationalPark.new('Black Canyon', 25)
    honda = Vehicle.new('2001', 'Honda', 'Civic')
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    jude = Passenger.new({ 'name' => 'Jude', 'age' => 20 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    honda.add_passenger(charlie)
    honda.add_passenger(jude)
    honda.add_passenger(taylor)
    national_park.vehicles_entered(honda)
    toyota = Vehicle.new('2012', 'Toyota', '4runner')
    sam = Passenger.new({ 'name' => 'Sam', 'age' => 23 })
    grace = Passenger.new({ 'name' => 'Grace', 'age' => 25 })
    elise = Passenger.new({ 'name' => 'Elise', 'age' => 26 })
    toyota.add_passenger(sam)
    toyota.add_passenger(grace)
    toyota.add_passenger(elise)
    national_park.vehicles_entered(toyota)
    national_park.passengers_entered
    expect(national_park.revenue).to eq(125)
  end
end
