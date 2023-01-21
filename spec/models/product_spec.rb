require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with four fields' do
      @category = Category.new(name: 'test')
      @category.save
      @product = Product.new(name: 'sample', price_cents: 100, quantity: 1, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it 'should be invalid without a name' do
      @category = Category.new(name: 'test')
      @category.save
      @product = Product.new(name: nil, price_cents: 100, quantity: 1, category: @category)
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should be invalid without a price' do
      @category = Category.new(name: 'test')
      @category.save
      @product = Product.new(name: 'sample', price_cents: nil, quantity: 1, category: @category)
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'should be invalid without a quantity' do
      @category = Category.new(name: 'test')
      @category.save
      @product = Product.new(name: 'sample', price_cents: 100, quantity: nil, category: @category)
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should be invalid without a price_cents' do
      @category = Category.new(name: 'test')
      @category.save
      @product = Product.new(name: 'sample', price_cents: 100, quantity: 1, category: nil)
      @product.save
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
