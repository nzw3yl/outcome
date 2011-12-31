class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :work_id
      t.integer :outcome_id
      t.integer :effort

      t.timestamps
    end
  end
end
