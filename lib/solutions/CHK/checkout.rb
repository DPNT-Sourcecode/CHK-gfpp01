# noinspection RubyUnusedLocalVariable
class Checkout
  VALID_PRODUCTS = "ABCDEF"

  attr_reader :price_table

  def initialize
    @price_table = {
      "A" => {:price => 50, :offer => [
          {:quantity => 3, :offer_price => 130},
          {:quantity => 5, :offer_price => 200}
      ]},
      "B" => {:price => 30, :offer => {:quantity => 2, :offer_price => 45}},
      "C" => {:price => 20},
      "D" => {:price => 15},
      "E" => {:price => 40, :offer => {:quantity => 2, :free_sku => "B"}},
      "F" => {:price => 10, :offer => {:quantity => 3, :free_sku => "F"}}
    }
    @total_price = -1
  end

  def checkout(skus)
    if valid_input?(skus)
      @total_price = 0
      set_item_count(skus)
      apply_free_sku_special_offers(skus)
      calculate_total_price
    end
    @total_price
  end

  private

  def valid_input?(skus)
    skus.delete(VALID_PRODUCTS).empty?
  end

  def set_item_count(skus)
    @item_count = skus.split("").each_with_object(Hash.new(0)) do |sku, hash|
      hash[sku] += 1
    end
  end

  def calculate_total_price
    @item_count.each do |sku, count|
      @count = count
      apply_special_offer_prices(sku, price_table[sku][:offer]) if price_table[sku].key?(:offer)
      @total_price += @count * price_table[sku][:price]
    end
    @total_price
  end

  def apply_special_offer_prices(sku, offer)
    if offer.is_a?(Array)
      offer.select { |o| o.key?(:offer_price) }.sort_by { |o| o[:quantity] }.reverse_each do |o|
        apply_special_offer_price(o)
      end
    elsif offer.is_a?(Hash) && offer.key?(:offer_price)
      apply_special_offer_price(offer)
    end
  end

  def apply_special_offer_price(offer)
    while @count >= offer[:quantity]
      @total_price += offer[:offer_price]
      @count -= offer[:quantity]
    end
  end

  def apply_free_sku_special_offers(skus)
    @item_count_updates = Hash.new(0)
    @item_count.each do |sku, count|
      @count = count
      if price_table[sku].key?(:offer)
        apply_free_sku_special_offer(sku, price_table[sku][:offer])
      end
    end
    update_item_count
  end

  def apply_free_sku_special_offer(sku, offer)
    if offer.is_a?(Hash) && offer.key?(:free_sku)
      update_item_count_updates(sku, offer)
    elsif offer.is_a?(Array)
      offer.select { |o| o.key?(:free_sku) }.sort_by { |o| o[:quantity] }.reverse_each do |o|
        update_item_count_updates(sku, o)
      end
    end
  end

  def update_item_count_updates(sku, offer)
    while @count >= offer[:quantity]
      @count -= offer[:quantity]
      @item_count_updates[offer[:free_sku]] -= 1
    end
  end

  def update_item_count
    @item_count_updates.each do |sku, update_count|
      next unless @item_count[sku] > 0

      if @item_count[sku] + update_count >= 0
        @item_count[sku] += update_count
      else
        @item_count[sku] = 0
      end
    end
  end
end


