class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :events
end
