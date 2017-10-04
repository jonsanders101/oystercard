class Oystercard
  attr_reader :balance, :entry_station

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1


  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @status = false
  end

  def top_up (money)
    fail 'You have exceeded card limit' if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end

  def in_journey?
    @status
  end

  def tap_in(station)
    fail 'Insufficient funds' if @balance < MINIMUM_BALANCE
    @status = true
    @entry_station = station
  end

  def tap_out
    @status = false
    deduct MINIMUM_BALANCE
  end

private
  def deduct (amount)
    @amount = amount
    @balance -= @amount
  end

end
