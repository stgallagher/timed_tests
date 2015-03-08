class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :top_factor
      t.integer :bottom_factor
      t.string :operator
      t.integer :answer

      t.timestamps null: false
    end
  end
end
