class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :description
      t.integer :progress_metric_id
      t.integer :effort
      t.integer :user_id

      t.timestamps
    end
  end
end
