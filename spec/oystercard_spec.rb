require 'oystercard'
describe Oystercard do
  it "#balance should return 0 as a default when Oystercard is initialised" do
    expect(subject.balance).to eq 0
  end
end
