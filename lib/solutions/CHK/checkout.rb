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
      apply_group_discount_offers
      calculate_total_price
    end
    @total_price
  end

  private

  attr_reader :price_table, :sku_offer_table, :group_offer_table, :price_offer_table

  def valid_input?(skus)
    skus.delete(VALID_PRODUCTS).empty?
  end

  def update_initial_item_count(skus)
    @item_count = skus.split("").each_with_object(Hash.new(0)) do |sku, hash|
      hash[sku] += 1
    end
  end

  def apply_free_sku_special_offers
    @item_count_updates = Hash.new(0)
    @item_count.each do |sku, count|
      @count = count
      apply_free_sku_special_offer(sku_offer_table[sku]) if sku_offer_table.key?(sku)
    end
    update_item_count
  end

  def apply_free_sku_special_offer(offer)
    offer.sort_by { |o| o[:quantity] }.reverse_each do |o|
      while @count >= o[:quantity]
        @count -= o[:quantity]
        @item_count_updates[o[:free_sku]] -= 1
      end
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

  def apply_group_discount_offers
    group_offer_table.each do |group, offer|
      group_count = group.each_char.sum { |sku| @item_count[sku] }
      next unless group_count >= offer[:quantity]

      # Add the offer price to the total price
      offer_count = group_count / offer[:quantity]
      @total_price += offer_count * offer[:offer_price]
      # Remove the offer quantity from the item count
      number_of_products = offer_count * offer[:quantity]
      # binding.pry
      update_item_count_after_group_discount(group, number_of_products)
      # binding.pry
    end
  end

  def update_item_count_after_group_discount(group, number_of_products)
    group.each_char do |sku|
      next unless @item_count[sku].positive?

      if @item_count[sku] >= number_of_products
        @item_count[sku] -= number_of_products
        break
      else
        number_of_products -= @item_count[sku]
        @item_count[sku] = 0
      end
    end
  end

  def calculate_total_price
    @item_count.each do |sku, count|
      @count = count
      apply_special_offer_prices(price_offer_table[sku]) if price_offer_table.key?(sku)
      @total_price += @count * price_table[sku]
    end
  end

  def apply_special_offer_prices(offer)
    offer.sort_by { |o| o[:quantity] }.reverse_each do |o|
      while @count >= o[:quantity]
        @total_price += o[:offer_price]
        @count -= o[:quantity]
      end
    end
  end
end




