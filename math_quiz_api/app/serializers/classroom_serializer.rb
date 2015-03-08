class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids

  has_many :students

  has_one :teacher

  has_one :school
end
