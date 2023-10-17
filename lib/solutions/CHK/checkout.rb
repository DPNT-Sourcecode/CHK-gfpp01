# noinspection RubyUnusedLocalVariable
class Checkout
  VALID_PRODUCTS = "ABCDE"

  attr_accessor :price_table, :item_count, :total_price

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

    set_item_count(skus)
    calculate_total_price
  end

  def valid_input?(skus)
    skus.delete(VALID_PRODUCTS).empty?
  end

  def set_item_count(skus)
    @item_count = skus.split("").each_with_object(Hash.new(0)) do |sku, hash|
      hash[sku] += 1
    end
  end

  def calculate_total_price
    @total_price = 0
    item_count.each do |sku, count|
      apply_special_offers(sku, price_table[sku][:offer], count) if price_table[sku].key?(:offer)
      total_price += count * price_table[sku][:price]
    end
    total_price
  end

  def apply_special_offers(sku, offer, count)
    if offer.is_a?(Array)
      offer.sort_by { |o| o[:quantity] }.reverse_each do |o|
        apply_special_offer(sku, o, count)
      end
    elsif offer.is_a?(Hash)
      apply_special_offer(sku, offer, count)
    end
  end

  def apply_special_offer(sku, offer, count)
    if offer.key?(:offer_price)
      apply_special_offer_price(offer, count)
    elsif offer.key?(:free_sku)
      apply_free_sku_offer(sku, offer, count)
    end
  end

  def apply_special_offer_price(offer, count)
    while count >= offer[:quantity]
      binding.pry
      total_price += offer[:offer_price]
      count -= offer[:quantity]
    end
  end

  def apply_free_sku_offer(sku, offer, count)
    while count >= offer[:quantity]
      total_price += price_table[sku][:price] * offer[:quantity]
      count -= offer[:quantity]
      item_count[offer[:free_sku]] += 1
    end
  end
end




