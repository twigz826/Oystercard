require 'oystercard'

describe Oystercard do
  let(:card) { described_class.new }

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
      card.top_up(Oystercard::MAX_BALANCE)
      expect { card.top_up (5) }.to raise_error("Max balance of #{Oystercard::MAX_BALANCE} exceeded")
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "deducts money from an oystercard" do
      card.top_up(10)
      expect { card.deduct(5) }.to change { card.balance }.by(-5)
    end
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(card.in_journey?).to be false
    end
  end

  describe '#touch_in' do
    it "can touch in" do
      card.touch_in
      expect(card.in_journey?).to be true
    end
  end

  describe '#touch_out' do
    it "can touch out" do
      card.touch_in
      card.touch_out
      expect(card.in_journey?).to be false
    end
  end
end
