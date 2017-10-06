require 'oystercard'

class Journey

  def initialize(oystercard)
    @oystercard = oystercard
    @oystercard.journey_history << { entry_station: nil, exit_station: nil}
  end

  def tap_in(station)
    fail 'Insufficient funds' if @oystercard.insufficient_balance?
    @entry_station = station
    @oystercard.deduct(Oystercard::PENALTY_FARE)
    #
     @oystercard.journey_history[-1][:entry_station] = @entry_station
  end
#
#   def tap_out(station)
#     @oystercard.journey_history[-1][:exit_station] = station
#     reimburse_fare(@entry_station, station) if tapped_in?
#     @oystercard.deduct(Oystercard::PENALTY_FARE) if !tapped_in?
#   end
#
#
#
#   def reimburse_fare(_station, _station1)
#     # to be done
#   end
#
# private
#   def tapped_in?
#     !!@entry_station
#   end
end
