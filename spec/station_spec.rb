require 'station'

describe Station do
  let(:name) {'station_name'}
  let(:zone) {'zone'}
  subject(:station) { described_class.new(name, zone) }

  describe '#name' do
    it 'stores station name' do
      expect(station.name).to eq(name)
    end
  end

  describe '#zone' do
    it 'stores zone name' do
    expect(station.zone).to eq(zone)
    end
  end
end
