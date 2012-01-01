class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :name
      t.integer :outcome_id
      t.integer :target
      t.integer :progress_metric_id
      t.integer :user_id
      t.string :email

      t.timestamps
    end
    add_index :suggestions, :user_id
    add_index :suggestions, :email
  end
end
