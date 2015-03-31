class UserLoginSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :role
end
