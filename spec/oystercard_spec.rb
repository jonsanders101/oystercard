require 'oystercard'
describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double(:station) }


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

  it '#has no journey history by default' do
    expect(oystercard.journey_history).to eq []
  end
end
