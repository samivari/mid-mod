require './lib/passenger'

RSpec.describe do
  it 'has a name' do
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    expect(charlie.name).to eq('Charlie')
  end

  it 'has an age' do
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    expect(charlie.age).to eq(18)
  end

  it 'is an adult' do
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    expect(charlie.adult?).to be true
  end

  it 'is not an adult' do
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    expect(taylor.adult?).to be false
  end

  it 'is not a driver' do
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    expect(charlie.driver?).to be false
  end

  it 'is a driver' do
    charlie = Passenger.new({ 'name' => 'Charlie', 'age' => 18 })
    taylor = Passenger.new({ 'name' => 'Taylor', 'age' => 12 })
    charlie.drive
    expect(charlie.driver?).to be true
  end
end
