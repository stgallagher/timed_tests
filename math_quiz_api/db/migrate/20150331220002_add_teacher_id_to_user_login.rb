class AddTeacherIdToUserLogin < ActiveRecord::Migration
  def change
    add_column :user_logins, :teacher_id, :integer
  end
end
