class AddQuizIdToQuizSession < ActiveRecord::Migration
  def change
    add_column :quiz_sessions, :quiz_id, :integer
  end
end
