class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
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

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
