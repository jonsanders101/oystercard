require 'oystercard'
describe Oystercard do
  it "#balance should return 0 as a default when Oystercard is initialised" do
    expect(subject.balance).to eq 0
  end
  it "#top_up should change the balance on the Oystercard" do
    expect(subject.top_up(99)).to eq 99
    expect(subject.top_up(22)).to eq 121
  end
end
