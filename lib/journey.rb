class Journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @complete = false
  end

  def exit(station = nil)
    @exit_station = station
    @complete = true
    self
  end

  def fare
    penalty? ? PENALTY_FARE : MIN_FARE
  end

  def complete?
    @complete
  end

  private

  def penalty?
    (@entry_station.nil? || @exit_station.nil?)
  end
end
