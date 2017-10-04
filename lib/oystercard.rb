class Oystercard
  attr_reader :balance, :entry_station

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up (money)
    fail 'You have exceeded card limit' if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def in_journey?
    !!@entry_station
  end

  def tap_in(station)
    fail 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def tap_out
    deduct MINIMUM_BALANCE
    @entry_station = nil
  end

private
  def deduct (amount)
    @amount = amount
    @balance -= @amount
  end

end
