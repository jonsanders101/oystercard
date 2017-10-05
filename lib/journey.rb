require 'oystercard'

class Journey

  def initialize(oystercard)
    @oystercard = oystercard
  end

  def tap_in(station)
    fail 'Insufficient funds' if @oystercard.insufficient_balance?
    @entry_station = station

    @oystercard.deduct(Oystercard::PENALTY_FARE)

    @oystercard.journey_history << { entry_station: station, exit_station: nil}
  end

  def tap_out(station)
    @exit_station = station
    if tapped_in?
      @oystercard.journey_history[-1][:exit_station] = @exit_station
      reimburse_fare(@entry_station, @exit_station)
    else
      @oystercard.deduct(Oystercard::PENALTY_FARE)
      @oystercard.journey_history << { entry_station: nil, exit_station: @exit_station}
    end
    @entry_station = nil
  end

  def tapped_in?
    !!@entry_station
  end

  def reimburse_fare(@entry_station, @exit_station)

  end
end
