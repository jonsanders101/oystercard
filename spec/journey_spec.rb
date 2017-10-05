require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:oystercard) { double(:oystercard, balance: 1) }
  # let(:entry_station) { double(:entry_station) }
  # let(:entry_station) { double(:exit_station) }
  let(:station) { double(:station) }

  describe "#tap_in" do

    it '#card in use' do
      journey.tap_in(station)
      expect(journey).to be_in_journey
    end

    it '#tap_in raises error if balance below minimum' do
      expect { oystercard.tap_in(station) }.to raise_error('Insufficient funds')
    end

    it 'remembers the entry station' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.tap_in(station)
      expect(oystercard.entry_station).to eq (station)
    end

    it '#creates one journey' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.tap_in(station)
      subject.tap_out(station)
      expect(oystercard.journey_history.length).to eq 1
      end

  end

  describe "#tap_out" do

    it '#card not in use' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.tap_in(station)
      subject.tap_out(station)
      expect(oystercard).to_not be_in_journey
    end

      it '#deducts mimumum_balance' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.tap_in(station)
      expect { oystercard.tap_out(station)}.to change {oystercard.balance}.by(- Oystercard::MINIMUM_BALANCE)
    end

    it 'forgets the entry station' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.tap_in(station)
      subject.tap_out(station)
      expect(oystercard.entry_station).to eq nil
    end

    it '#records exit station' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.tap_in(station)
      expect(oystercard.tap_out(station)).to eq oystercard.journey_history[-1][:exit_station]
    end
  end


end
