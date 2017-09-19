class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      @item = Item.find(line_item.item_id)
      total += line_item.quantity * @item.price
    end
    total
  end

  def add_item(item)
    if !!self.line_items.find_by(item_id: item)
      @line_item = self.line_items.find_by(item_id: item)
      @line_item.quantity += 1
      @line_item
    else
      @line_item = self.line_items.new(item_id: item)
    end
  end
end
