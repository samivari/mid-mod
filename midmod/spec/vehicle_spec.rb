require './lib/vehicle'
require './lib/passenger'

RSpec.describe do
  it 'has a year' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    expect(vehicle.year).to eq('2001')
  end

  it 'has a make' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    expect(vehicle.make).to eq('Honda')
  end

  it 'has a model' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    expect(vehicle.model).to eq('Civic')
  end

  it 'isnt speeding' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    expect(vehicle.speeding?).to be false
  end

  it 'is speeding' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    vehicle.speed
    expect(vehicle.speeding?).to be true
  end

  it 'has no passengers' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')

    expect(vehicle.passengers).to eq([])
  end

  it 'has passengers' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    jude = Passenger.new({ 'name' => 'Jude', 'age' => 20 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    expect(vehicle.passengers).to eq([charlie, jude, taylor])
  end

  it 'has passengers' do
    vehicle = Vehicle.new('2001', 'Honda', 'Civic')
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    jude = Passenger.new({ 'name' => 'Jude', 'age' => 20 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)
    expect(vehicle.num_adults).to eq(2)
  end
end
