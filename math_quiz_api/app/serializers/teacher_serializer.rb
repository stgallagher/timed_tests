class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :grade

  has_one :classroom

  has_many :students
end
