require 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journey_history

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  PENALTY_FARE    = 6

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey_history = []
    # @journey = Journey.new
  end

  def top_up (money)
    fail 'You have exceeded card limit' if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def balance
    @balance
  end

  def deduct (amount)
    @amount = amount
    @balance -= @amount
  end

  def insufficient_balance?
    @balance < MINIMUM_BALANCE
  end
end
