require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @u = User.new(name: 'jakir', email: 'jakir@test.com', password: '123456')
    @r = @u.recipes.new(name: 'Recipe Title', preparation_time: 2, cooking_time: 4,
                        description: 'This is dummy description for the recipe.', public: true)
  end
  it 'should return the correct name' do
    expect(@r.name).to eq 'Recipe Title'
  end

  it 'should return the correct preparation_time' do
    expect(@r.preparation_time).to eq 2
  end

  it 'should return the correct cooking_time' do
    expect(@r.cooking_time).to eq 4
  end

  it 'should return the description' do
    expect(@r.description).to eq 'This is dummy description for the recipe.'
  end
end
