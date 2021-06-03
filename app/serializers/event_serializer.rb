class EventSerializer
  def initialize(event_object)
    @event = event_object
  end

  def to_serialized_json
    user = @event.user
    {
      user: {
        username: user.username,
        email: user.email,
        events: user.events,
      },
      eventId: @event.id
    }
  end
end
