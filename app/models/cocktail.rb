class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :doses, :dependent => :delete_all
  has_many :reviews, :dependent => :delete_all
  has_many :ingredients, through: :doses
end
