class GuestSerializer
  def initialize(guest_object)
    @guest = guest_object
  end

  def to_serialized_json
    @guest.to_json(except: [:created_at, :updated_at, :event_id])
  end
end
