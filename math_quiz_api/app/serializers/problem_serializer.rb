class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :top_factor, :bottom_factor, :operator, :answer

  embed :ids

  has_many :quizzes
end
