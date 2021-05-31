class Purchase < ApplicationRecord
  belongs_to :meal
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
end
