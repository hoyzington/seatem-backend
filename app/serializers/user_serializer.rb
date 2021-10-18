# frozen_string_literal: true

class UserSerializer
  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    @user.to_json(only: %i[id username email])
  end

  def to_serialized_json_with_events
    @user.to_json(
      include: {
        events: {
          include: {
            guests: {
              except: %i[created_at updated_at event_id]
            }
          },
          except: %i[created_at user_id]
        }
      },
      only: %i[id username email]
    )
  end
end
