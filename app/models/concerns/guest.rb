class Api::V1::Guest < ApplicationRecord
  belongs_to :event
  validates_presence_of :firstName
end
