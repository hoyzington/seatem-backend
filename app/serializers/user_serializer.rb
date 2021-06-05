class UserSerializer
  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    {
      user: {
        id: @user.id
        username: @user.username,
        email: @user.email,
      },
      events: @user.events
    }
  end
end
