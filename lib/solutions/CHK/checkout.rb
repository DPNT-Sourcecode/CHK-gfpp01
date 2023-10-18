# noinspection RubyUnusedLocalVariable
class Checkout
  VALID_PRODUCTS = ("A".."Z").to_a.join

  def initialize
    @price_table = {
      "A" => 50, "B" => 30, "C" => 20, "D" => 15, "E" => 40, "F" => 10, "G" => 20, "H" => 10, "I" => 35, "J" => 60,
      "K" => 70, "L" => 90, "M" => 15, "N" => 40, "O" => 10, "P" => 50, "Q" => 30, "R" => 50, "S" => 20, "T" => 20,
      "U" => 40, "V" => 50, "W" => 20, "X" => 17, "Y" => 20, "Z" => 21
    }
    @sku_offer_table = {
      "E" => [{:quantity => 2, :free_sku => "B"}],
      "F" => [{:quantity => 3, :free_sku => "F"}],
      "N" => [{:quantity => 3, :free_sku => "M"}],
      "R" => [{:quantity => 3, :free_sku => "Q"}],
      "U" => [{:quantity => 4, :free_sku => "U"}]
    }
    @group_offer_table = {
      "ZYTSX" => {:quantity => 3, :offer_price => 45}
    }
    @price_offer_table = {
      "A" => [{:quantity => 3, :offer_price => 130}, {:quantity => 5, :offer_price => 200}],
      "B" => [{:quantity => 2, :offer_price => 45}],
      "H" => [{:quantity => 5, :offer_price => 45}, {:quantity => 10, :offer_price => 80}],
      "K" => [{:quantity => 2, :offer_price => 120}],
      "P" => [{:quantity => 5, :offer_price => 200}],
      "Q" => [{:quantity => 3, :offer_price => 80}],
      "V" => [{:quantity => 2, :offer_price => 90}, {:quantity => 3, :offer_price => 130}],
    }
    @total_price = -1
  end

  def checkout(skus)
    if valid_input?(skus)
      @total_price = 0
      update_initial_item_count(skus)
      apply_free_sku_special_offers
      calculate_total_price
    end
    @total_price
  end

  private

  attr_reader :price_table

  def valid_input?(skus)
    skus.delete(VALID_PRODUCTS).empty?
  end

  def update_initial_item_count(skus)
    @item_count = skus.split("").each_with_object(Hash.new(0)) do |sku, hash|
      hash[sku] += 1
    end
  end

  def calculate_total_price
    @item_count.each do |sku, count|
      @count = count
      apply_special_offer_prices(price_table[sku][:offer]) if price_table[sku].key?(:offer)
      @total_price += @count * price_table[sku][:price]
    end
    @total_price
  end

  def apply_special_offer_prices(offer)
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

  def apply_free_sku_special_offers
    @item_count_updates = Hash.new(0)
    @item_count.each do |sku, count|
      @count = count
      apply_free_sku_special_offer(price_table[sku][:offer]) if price_table[sku].key?(:offer)
    end
    update_item_count
  end

  def apply_free_sku_special_offer(offer)
    if offer.is_a?(Hash) && offer.key?(:free_sku)
      update_item_count_updates(offer)
    elsif offer.is_a?(Array)
      offer.select { |o| o.key?(:free_sku) }.sort_by { |o| o[:quantity] }.reverse_each do |o|
        update_item_count_updates(o)
      end
    end
  end

  def update_item_count_updates(offer)
    while @count >= offer[:quantity]
      @count -= offer[:quantity]
      @item_count_updates[offer[:free_sku]] -= 1
    end
  end

  def update_item_count
    @item_count_updates.each do |sku, update_count|
      next unless @item_count[sku].positive?

      if @item_count[sku] + update_count >= 0
        @item_count[sku] += update_count
      else
        @item_count[sku] = 0
      end
    end
  end
end



