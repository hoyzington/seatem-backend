# frozen_string_literal: true

class GuestSerializer
  def initialize(guest_object)
    @guest = guest_object
  end

  def to_serialized_json
    @guest.to_json(only: %i[id firstName middleName lastName])
  end
end
