class EventSerializer
  def initialize(event_object)
    @event = event_object
  end

  def to_serialized_json
    @event.to_json(
      include: {
        guests: {
          except: [:created_at, :event_id]
        }
      },
      except: [:created_at, :user_id])
  end
end
