class Meal < ApplicationRecord
  belongs_to :chef, class_name: "User", foreign_key: "chef_id"
  has_many :purchases
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 6, maximum: 255 }
  validates :price, presence: true, length: { minimum: 1, maximum: 5 }
end
