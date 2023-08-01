class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.date :deadline
      t.boolean :completed

      t.timestamps
    end
  end
end
