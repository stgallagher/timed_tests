class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :grade

  embed :ids

  has_one :classroom
  has_many :quiz_sessions
  has_many :quizzes
end
