class AddQuizIdToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :quiz_id, :integer
  end
end
