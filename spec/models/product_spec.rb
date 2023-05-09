require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it "create a product if all of the validations are true" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Test", price_cents: 66666, quantity: 40, :category => @category) 
      expect(@product.valid?).to be true
      expect(@product.save).to be true
    end

    it "validates name presence" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: nil, price_cents: 66666, quantity: 40, :category => @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates price presence" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Test", price_cents: nil, quantity: 40, :category => @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "validates quantity presence" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Test", price_cents: 66666, quantity: nil, :category => @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates category presence" do
      @category = Category.new(name: "Test")
      @product = Product.new(name: "Test", price_cents: 66666, quantity: 40, :category => nil)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end