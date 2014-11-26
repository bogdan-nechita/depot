require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	test "product attributs must not be empty" do
      product = Product.new
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:price].any?
	end

	test "product price must be positive" do
	  product = Product.new(title: 'New Product', description: 'Some description.', image_url: 'zzz.jpg')
	  product.price = -2
	  assert product.invalid?
	  assert product.errors[:price].any?

	end

	test 'product title is at least 10 characters long' do
		product = Product.new(title: 'Product')
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:title].first.include? 'too short'
	
	end

end
