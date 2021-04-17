require 'oystercard'

describe Oystercard do
  let(:card) { described_class.new }
  let(:toppedup_card) { described_class.new(Oystercard::MAX_BALANCE) }
  let(:entry_station){ double :entry_station }
  let(:exit_station){ double :exit_station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#balance' do
    it "starts with a balance of 0" do
      expect(card.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "adds money on to an oystercard" do
      expect { card.top_up(5) }.to change { card.balance }.by(5)
    end

    it "returns an error if the max balance permitted is exceeded" do
      expect { toppedup_card.top_up (5) }.to raise_error("Max balance of #{Oystercard::MAX_BALANCE} exceeded")
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(card.in_journey?).to be false
    end
  end

  describe '#touch_out' do
    it "can touch out" do
      toppedup_card.touch_in(entry_station)
      toppedup_card.touch_out(exit_station)
      expect(toppedup_card.in_journey?).to be false
    end

    it "stores the exit station" do
      toppedup_card.touch_in(entry_station)
      toppedup_card.touch_out(exit_station)
      expect(toppedup_card.exit_station).to eq exit_station
    end

    it "deducts the minimum fare on touch_out" do
      toppedup_card.touch_in(entry_station)
      expect { toppedup_card.touch_out(exit_station) }.to change { toppedup_card.balance }.by(-Oystercard::MIN_FARE)
    end
  end

  describe '#touch_in' do
    it "can touch in" do
      toppedup_card.touch_in(entry_station)
      expect(toppedup_card.in_journey?).to be true
    end

    it "throws an error if a card with insufficient balance touches in" do
      expect { card.touch_in(entry_station) }.to raise_error("Insufficient balance, balance must exceed #{Oystercard::MIN_FARE}")
    end

    it 'stores the entry station' do
      toppedup_card.touch_in(entry_station)
      expect(toppedup_card.entry_station).to eq entry_station
    end
  end

  describe '#journeys' do
    it "initially has no journeys stored" do
      expect(toppedup_card.journeys).to be_empty
    end

    it "stores a journey in memory" do
      toppedup_card.touch_in(entry_station)
      toppedup_card.touch_out(exit_station)
      expect(toppedup_card.journeys).to include journey
    end
  end

end
