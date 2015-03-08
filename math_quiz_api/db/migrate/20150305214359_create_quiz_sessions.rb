class CreateQuizSessions < ActiveRecord::Migration
  def change
    create_table :quiz_sessions do |t|
      t.date :date
      t.integer :student_id
      t.integer :time_taken
      t.integer :correct
      t.integer :wrong
      t.integer :unanswered
      t.integer :score

      t.timestamps null: false
    end
  end
end
