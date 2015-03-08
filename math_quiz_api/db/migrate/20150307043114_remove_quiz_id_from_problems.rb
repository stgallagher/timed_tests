class RemoveQuizIdFromProblems < ActiveRecord::Migration
  def change
    remove_column :problems, :quiz_id, :integer
  end
end
