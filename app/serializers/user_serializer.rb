class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :email, :events
  # has_many :events, if: Proc.new {|record| record.events.any?}
end
