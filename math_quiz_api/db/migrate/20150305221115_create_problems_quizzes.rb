class CreateProblemsQuizzes < ActiveRecord::Migration
  def change
    create_table :problems_quizzes do |t|
      t.references :problem, index: true
      t.references :quiz, index: true
    end
    add_foreign_key :problems_quizzes, :problems
    add_foreign_key :problems_quizzes, :quizzes
  end
end
