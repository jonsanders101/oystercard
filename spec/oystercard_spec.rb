require 'oystercard'
describe Oystercard do
  subject(:oystercard) { described_class.new }


  describe "#top_up" do
    it "#top_up should change the balance on the Oystercard" do
      expect{ oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
    end
  end

  describe "#balance" do
    it '#balance should not exceed £90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { oystercard.top_up(90)}.to raise_error('You have exceeded card limit')
    end

    it "#balance should return 0 as a default when Oystercard is initialised" do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end
  end

  describe "#tap_in" do

    it '#card in use' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.tap_in
      expect(oystercard).to be_in_journey
    end

    it '#tap_in raises error if balance below minimum' do
      expect { oystercard.tap_in }.to raise_error('Insufficient funds')
    end

  end

  describe "#tap_out" do

    it '#card not in use' do
      subject.top_up(Oystercard::MINIMUM_BALANCE)
      subject.tap_in
      subject.tap_out
      expect(oystercard).to_not be_in_journey
    end

    it '#deducts mimumum_balance' do
    expect { oystercard.tap_out}.to change {oystercard.balance}.by(- Oystercard::MINIMUM_BALANCE)
  end
  end
end
