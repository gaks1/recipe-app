require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user1 = User.new(name: 'raihan', email: 'g@gmail.com', password: '123456', confirmed_at: Time.now)
    @food = Food.new(name: 'Apple', measurement_unit: 'piece', price: 10, quantity: 1, user: @user1)
  end

  it 'should have a correct name' do
    expect(@food.name).to eq('Apple')
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'should have a correct measurement_unit' do
    expect(@food.measurement_unit).to eq('piece')
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'should have a correct price' do
    expect(@food.price).to eq(10)
    @food.price = nil
    expect(@food).to_not be_valid
  end

  it 'should have a correct quantity' do
    expect(@food.quantity).to eq(1)
    @food.quantity = nil
    expect(@food).to_not be_valid
  end

  it 'should have a correct user' do
    expect(@food.user).to eq(@user1)
    @food.user = nil
    expect(@food).to_not be_valid
  end
end
