class CreateUserLogins < ActiveRecord::Migration
  def change
    create_table :user_logins do |t|
      t.text :username
      t.text :password
      t.text :role

      t.timestamps null: false
    end
  end
end
