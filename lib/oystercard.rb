require_relative 'station'
require_relative 'journey'

class Oystercard

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :journeys, :journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    raise "Max balance of #{MAX_BALANCE} exceeded" if amount + @balance > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    touch_out(nil) if !@journey.nil?
    raise "Insufficient balance, balance must exceed #{MIN_FARE}" if @balance < MIN_FARE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journey = Journey.new if @journey == nil
    @journeys.push(@journey.exit(station))
    complete_journey
  end

  def complete_journey
    deduct(@journey.fare)
    @journey = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
