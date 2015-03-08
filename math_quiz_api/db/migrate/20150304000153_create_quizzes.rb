class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.datetime :date
      t.string :level
      t.string :operator
      t.integer :max_time

      t.timestamps null: false
    end
  end
end
