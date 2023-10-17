require_solution 'CHK'

describe Checkout do
  subject(:checkout) { described_class.new.checkout(skus) }

  context "with a single A product" do
    let(:skus) { "A" }
    let(:total_price) { 50 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with multiple A products" do
    let(:skus) { "AAAA" }
    let(:total_price) { 180 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with a single B product" do
    let(:skus) { "B" }
    let(:total_price) { 30 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with multiple B products" do
    let(:skus) { "BBB" }
    let(:total_price) { 75 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with a single C product" do
    let(:skus) { "C" }
    let(:total_price) { 20 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with a single D product" do
    let(:skus) { "D" }
    let(:total_price) { 15 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  let(:skus) { "AABCDDBBA" }
  let(:total_price) { 255 }

  it "calculates the total price" do
    expect(checkout).to eq(total_price)
  end
end

