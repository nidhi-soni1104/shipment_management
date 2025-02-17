class User < ApplicationRecord
  # Include default Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  self.abstract_class = true

  # Fix: Ensure enum is correctly declared with a valid hash
  enum role: { customer: 0, delivery_partner: 1, admin: 2 }, prefix: true

  has_one :customer
  has_one :delivery_partner
end
