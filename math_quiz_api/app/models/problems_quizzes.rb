class ProblemsQuizzes < ActiveRecord::Base
  belongs_to :problem
  belongs_to :quiz
end
