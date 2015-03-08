class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids

  has_many :students
  has_many :classrooms
end
