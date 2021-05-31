class Meal < ApplicationRecord
  belongs_to :chef, class_name: "User", foreign_key: "chef_id"
  has_many :purchases
end
