class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    raise "Max balance of #{MAX_BALANCE} exceeded" if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance, balance must exceed #{MIN_FARE}" if @balance < MIN_FARE
    @entry_station = station
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_out(station)
    @exit_station = station
    @journeys.push({entry_station: @entry_station, exit_station: @exit_station})
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
