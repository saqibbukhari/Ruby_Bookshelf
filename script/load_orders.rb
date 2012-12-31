Order.transaction do
	(1..100).each do |i|
	Order.create(:name => "Customer #{i}", :address => "Customer #{i} Address", :email => "customer-#{i}@test.com", :pay_type => "Check")
	end
end

