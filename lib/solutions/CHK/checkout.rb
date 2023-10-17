# noinspection RubyUnusedLocalVariable
class Checkout
  VALID_PRODUCTS = "ABCDE"

  def initialize
    @price_table = {
      "A" => {
        :price => 50,
        :offer => [
          {:quantity => 3, :offer_price => 130},
          {:quantity => 5, :offer_price => 200}
        ]
      },
      "B" => {
        :price => 30,
        :offer => {:quantity => 2, :offer_price => 45}
      },
      "C" => {:price => 20},
      "D" => {:price => 15},
      "E" => {
        :price => 40,
        :offer => {:quantity => 2, :free_sku => "B"}
      }
    }
  end

  def checkout(skus)
    return -1 unless valid_input?(skus)

    item_count = count_items(skus)
    calculate_total_price(item_count)
  end

  def valid_input?(skus)
    skus.delete(VALID_PRODUCTS).empty?
  end

  def count_items(skus)
    item_count = skus.split("").each_with_object(Hash.new(0)) do |sku, hash|
      hash[sku] += 1
    end
  end

  def calculate_total_price(item_count)
    total_price = 0
    item_count.each do |sku, count|
      if @price_table[sku].key?(:offer)
        offer = @price_table[sku][:offer]
        while count >= offer[:quantity]
          total_price += offer[:offer_price]
          count -= offer[:quantity]
        end
      end
      total_price += count * @price_table[sku][:price]
    end
    total_price
  end
end

