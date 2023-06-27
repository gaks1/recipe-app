class User < ApplicationRecord
  has_many: recipe
  validates :name, presence: true
end
