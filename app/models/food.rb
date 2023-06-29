class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  accepts_nested_attributes_for :recipe_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_or_equal_to: 0 }
end
