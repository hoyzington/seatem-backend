class Event < ApplicationRecord
  belongs_to :user
  has_many :guests
  validates_presence_of :name, :table, :guestQty
end
