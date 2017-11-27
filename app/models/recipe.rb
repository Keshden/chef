class Recipe < ApplicationRecord
  belongs_to :chef
  validates :recipeName, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 7, maximum: 100}
  validates :description, presence: true,
            length: {minimum: 15, maximum: 500}


end
