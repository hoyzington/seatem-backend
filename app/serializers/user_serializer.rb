class UserSerializer
  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    @user.to_json(only: [:id, :username, :email])
  end

  def to_serialized_json_with_events
    @user.to_json(
      include: {
        events: {
          include: {
            guests: {
              except: [:created_at, :updated_at, :event_id]
            }
          },
          except: [:created_at, :user_id]
        }
      },
      only: [:id, :username, :email]
    )
  end
end
