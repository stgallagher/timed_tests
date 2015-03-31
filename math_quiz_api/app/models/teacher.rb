class Teacher < ActiveRecord::Base
  belongs_to :classroom

  has_many :students, :through => :classroom
  has_one :user_login
end
