class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchases
  has_many :meals
  ## Validation on edit, but not creation? Removing for now.
  # validates :postcode, presence: true, length: { minimum: 7, maximum: 8 }
  # validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  # validates :last_name, presence: true, length: { minimum: 2, maximum: 100 }
end
