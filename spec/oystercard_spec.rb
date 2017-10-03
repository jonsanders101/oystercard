require 'oystercard'
describe Oystercard do
  subject(:oystercard) { described_class.new }
  it "#balance should return 0 as a default when Oystercard is initialised" do
    expect(oystercard.balance).to eq 0
  end
  it "#top_up should change the balance on the Oystercard" do
    expect(oystercard.top_up(99)).to eq 99
    expect(oystercard.top_up(22)).to eq 121
  end
end
