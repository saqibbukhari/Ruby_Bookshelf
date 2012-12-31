class CombineItemsInCart < ActiveRecord::Migration
  def up
	Cart.all.each do |c|
		sum = c.line_items.group(:product_id).sum(:quantity)
		sum.each do |p_id,q|
			if q>1
				c.line_items.where(:product_id => p_id).delete_all
				c.line_items.create(:product_id=>p_id, :quantity=>q)
			end
		end
	end

  end

  def down
  end
end
