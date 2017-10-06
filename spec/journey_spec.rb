require 'journey'

describe Journey do

  let(:oystercard) { double(:oystercard, :insufficient_balance? => false, :journey_history => [] ) }
    subject(:journey) { described_class.new(oystercard) }
  # let(:entry_station) { double(:entry_station) }
  # let(:entry_station) { double(:exit_station) }
  let(:station) { double(:station) }

  describe "#tap_in" do


      it 'expects to raise error if insufficient funds' do
     #double(:oystercard, :insufficient_balance? => false)
     allow(oystercard).to receive(:insufficient_balance?) {true}
        expect{journey.tap_in(station)}.to raise_error 'Insufficient funds'

    end

  end

end
