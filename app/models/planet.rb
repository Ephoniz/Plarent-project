class Planet < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :bookings

  has_many_attached :photos

  validates :name, presence: true, length: { minimum: 4 }
  validates :radius, presence: true
  validates :atmosphere, presence: true, inclusion: { in: %w[oxygen nitrogen carbon_dioxide argon],
                                                      message: "Not a valid atmosphere" }
  validates :galaxy, presence: true, inclusion: { in: %w[milkyway andromeda ic1101 tadpole],
                                                  message: "Not a valid galaxy" }
  validates :price, presence: true
end
