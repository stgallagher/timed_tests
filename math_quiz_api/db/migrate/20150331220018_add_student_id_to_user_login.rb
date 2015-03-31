class AddStudentIdToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :student_id, :integer
  end
end
