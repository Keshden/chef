class Chef < ApplicationRecord
  has_many :recipes, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :chefName, length: {minimum: 5, maximum: 100},
            presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 100}
  has_secure_password

end
