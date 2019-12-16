require_relative 'plane.rb'

class Airport
  DEFAULT_AIRPORT = "Heathrow"
  DEFAULT_CAPACITY = 2

  def initialize(default_airport = DEFAULT_AIRPORT, capacity = DEFAULT_CAPACITY)
    @planes = []
    @default_airport = default_airport
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?

    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
    return plane
  end

private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end
end
