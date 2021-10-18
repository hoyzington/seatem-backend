# frozen_string_literal: true

class EventSerializer
  def initialize(event_object)
    @event = event_object
  end

  def to_serialized_json
    @event.to_json(except: %i[created_at user_id])
  end

  def to_serialized_json_with_guests
    @event.to_json(
      include: {
        guests: {
          except: %i[created_at updated_at event_id]
        }
      },
      except: %i[created_at user_id]
    )
  end
end
