class AddUserLoginIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :user_login_id, :integer
  end
end
