require 'station'

describe Station do

  let(:station) { described_class.new("Bank", 1) }

  it "knows its name" do
    expect(station.name).to eq "Bank"
  end

  it "knows its zone number" do
    expect(station.zone_number).to eq 1
  end
end
