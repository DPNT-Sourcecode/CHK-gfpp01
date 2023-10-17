require_solution 'CHK'

describe Checkout do
  let(:skus) { "AABCDDBBA" }
  let(:total_price) { 255 }

  it "calculates the total price" do
    expect(described_class.new.checkout(skus)).to eq(total_price)
  end
end
