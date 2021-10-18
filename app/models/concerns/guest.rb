# frozen_string_literal: true

class Guest < ApplicationRecord
  belongs_to :event
  validates_presence_of :firstName
end
