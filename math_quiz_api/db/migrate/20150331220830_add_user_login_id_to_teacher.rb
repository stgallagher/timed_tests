class AddUserLoginIdToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :user_login_id, :integer
  end
end
