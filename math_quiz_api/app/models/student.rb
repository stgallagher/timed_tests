class Student < ActiveRecord::Base
  belongs_to :classroom
  has_many :quiz_sessions
  has_many :quizzes, :through => :quiz_sessions
  has_one :user_login
end
