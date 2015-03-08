class QuizSerializer < ActiveModel::Serializer
  attributes :id, :level, :operator, :max_time

  embed :ids

  has_many :problems

  has_many :quiz_sessions
end
