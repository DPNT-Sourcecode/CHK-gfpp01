require_solution 'CHK'

describe Checkout do
  subject(:checkout) { described_class.new.checkout(skus) }

  context "when ordering A" do
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
  end

  context "when ordering B" do
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
  end

  context "when ordering C" do
    context "with a single C product" do
      let(:skus) { "C" }
      let(:total_price) { 20 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering D" do
    context "with a single D product" do
      let(:skus) { "D" }
      let(:total_price) { 15 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering E" do
    context "with a single E product" do
      let(:skus) { "E" }
      let(:total_price) { 40 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 2 E, and a B, products" do
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
  end

  context "when ordering F" do
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
  end

  context "when ordering G" do
    context "with 1 G products" do
      let(:skus) { "G" }
      let(:total_price) { 20 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering H" do
    context "with 1 H products" do
      let(:skus) { "H" }
      let(:total_price) { 10 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 5 H products" do
      let(:skus) { "H" * 5 }
      let(:total_price) { 45 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 10 H products" do
      let(:skus) { "H" * 10 }
      let(:total_price) { 80 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering I" do
    context "with 1 product" do
      let(:skus) { "I" }
      let(:total_price) { 35 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering J" do
    context "with 1 product" do
      let(:skus) { "J" }
      let(:total_price) { 60 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering K" do
    context "with 1 product" do
      let(:skus) { "K" }
      let(:total_price) { 70 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 1 product" do
      let(:skus) { "K" * 2 }
      let(:total_price) { 120 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering L" do
    context "with 1 product" do
      let(:skus) { "L" }
      let(:total_price) { 90 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering M" do
    context "with 1 product" do
      let(:skus) { "M" }
      let(:total_price) { 15 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering N" do
    context "with 1 product" do
      let(:skus) { "N" }
      let(:total_price) { 40 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3 products" do
      let(:skus) { "N" * 3 }
      let(:total_price) { 120 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3, and an M product" do
      let(:skus) { "NNNM" }
      let(:total_price) { 120 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering O" do
    context "with 1 product" do
      let(:skus) { "O" }
      let(:total_price) { 10 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering P" do
    context "with 1 product" do
      let(:skus) { "P" }
      let(:total_price) { 50 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 5 products" do
      let(:skus) { "P" * 5 }
      let(:total_price) { 200 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering Q" do
    context "with 1 product" do
      let(:skus) { "Q" }
      let(:total_price) { 30 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3 products" do
      let(:skus) { "Q" * 3 }
      let(:total_price) { 80 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering R" do
    context "with 1 product" do
      let(:skus) { "R" }
      let(:total_price) { 50 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3 products" do
      let(:skus) { "R" * 3 }
      let(:total_price) { 150 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3, and a Q product" do
      let(:skus) { "RRRQ" }
      let(:total_price) { 150 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering S" do
    context "with 1 product" do
      let(:skus) { "S" }
      let(:total_price) { 20 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering T" do
    context "with 1 product" do
      let(:skus) { "T" }
      let(:total_price) { 20 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering U" do
    context "with 1 product" do
      let(:skus) { "U" }
      let(:total_price) { 40 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3 products" do
      let(:skus) { "U" * 3 }
      let(:total_price) { 120 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 4 products" do
      let(:skus) { "U" * 4 }
      let(:total_price) { 120 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering V" do
    context "with 1 product" do
      let(:skus) { "V" }
      let(:total_price) { 50 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 2 products" do
      let(:skus) { "V" * 2 }
      let(:total_price) { 90 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end

    context "with 3 product" do
      let(:skus) { "V" * 3 }
      let(:total_price) { 130 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering W" do
    context "with 1 product" do
      let(:skus) { "W" }
      let(:total_price) { 20 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering X" do
    context "with 1 product" do
      let(:skus) { "X" }
      let(:total_price) { 17 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering Y" do
    context "with 1 product" do
      let(:skus) { "Y" }
      let(:total_price) { 20 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
    end
  end

  context "when ordering Z" do
    context "with 1 product" do
      let(:skus) { "Z" }
      let(:total_price) { 21 }

      it "calculates the total price" do
        expect(checkout).to eq(total_price)
      end
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

