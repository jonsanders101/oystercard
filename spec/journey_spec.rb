require 'journey'

describe Journey do

  let(:oystercard) { double(:oystercard, :insufficient_balance? => false, :journey_history => [{ entry_station: nil, exit_station: nil}], :deduct => nil ) }
  subject(:journey) { described_class.new(oystercard) }
  let(:station) { double(:station) }

  describe "#tap_in" do

    it 'expects to raise error if insufficient funds' do
      allow(oystercard).to receive(:insufficient_balance?) {true}
      expect{journey.tap_in(station)}.to raise_error 'Insufficient funds'
    end

    it 'deducts penalty fare on tap in' do
      expect(oystercard).to receive(:deduct)
      journey.tap_in(station)
    end

    it 'changes entry station' do
      expect { journey.tap_in(station) }.to change{ oystercard.journey_history[-1][:entry_station] }.from(nil).to(station)
    end

  end

end
