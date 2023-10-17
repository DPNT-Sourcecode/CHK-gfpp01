# noinspection RubyUnusedLocalVariable
class Checkout
  def initialize
    @price_table = {
      "A" => {:price => 50, :offer => {:quantity => 3, :offer_price => 130}},
      "B" => {:price => 30, :offer => {:quantity => 2, :offer_price => 45}},
      "C" => {:price => 20},
      "D" => {:price => 15}
    }
  end

  def checkout(skus)
    # Check for illegal input

    item_count = skus.split("").each_with_object(Hahs.new(0)) do |sku, hash|
      hash[sku] += 1
    end


  end

end

