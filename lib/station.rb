class Station

  attr_reader :name, :zone_number

  def initialize(name, zone_number)
    @name = name
    @zone_number = zone_number
  end
end
