class QuizSessionSerializer < ActiveModel::Serializer
  attributes :id, :date, :time_taken, :correct, :wrong, :unanswered, :score

  embed :ids

  has_one :student
  has_one :quiz
end
