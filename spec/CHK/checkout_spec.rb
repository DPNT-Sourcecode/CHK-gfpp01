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

  context "with 3 A products" do
    let(:skus) { "AAA" }
    let(:total_price) { 130 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 8 A products" do
    let(:skus) { "AAAAAAAA" }
    let(:total_price) { 330 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 9 A products" do
    let(:skus) { "AAAAAAAAA" }
    let(:total_price) { 380 }

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

  context "with a single E product" do
    let(:skus) { "E" }
    let(:total_price) { 40 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with multiple E products" do
    let(:skus) { "EEB" }
    let(:total_price) { 80 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 2 E products" do
    let(:skus) { "EE" }
    let(:total_price) { 80 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 3 E products" do
    let(:skus) { "EEE" }
    let(:total_price) { 120 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 1 F products" do
    let(:skus) { "F" }
    let(:total_price) { 10 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 2 F products" do
    let(:skus) { "FF" }
    let(:total_price) { 20 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 3 F products" do
    let(:skus) { "FFF" }
    let(:total_price) { 20 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with 4 F products" do
    let(:skus) { "FFFF" }
    let(:total_price) { 30 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end

  context "with multiple products" do
    let(:skus) { "AAABBBCDDEEEFFFF" }
    let(:total_price) { 375 }

    it "calculates the total price" do
      expect(checkout).to eq(total_price)
    end
  end
end

