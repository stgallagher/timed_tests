class Quiz < ActiveRecord::Base
  has_and_belongs_to_many :problems
  has_many :quiz_sessions
end
