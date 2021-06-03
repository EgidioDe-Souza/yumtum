class Meal < ApplicationRecord
  include PgSearch::Model
  belongs_to :chef, class_name: "User", foreign_key: "chef_id"
  has_many :purchases
  validates :name, presence: true, length: { minimum: 2, maximum: 255 }
  validates :description, presence: true, length: { minimum: 6, maximum: 255 }
  validates :price, presence: true, length: { minimum: 1, maximum: 5 }
  pg_search_scope :search_by_name_and_description,
                  against: %i[name description],
                  using: { tsearch: { prefix: true } }
  pg_search_scope :search_by_chef_location,
                  associated_against: { chef: :postcode },
                  using: { tsearch: { prefix: true } }
end
