class Event < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  validates_presence_of :name
  validates :guestQty, numericality: { greater_than: 3 }
end
