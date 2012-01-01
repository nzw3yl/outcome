class FixOutcomeName < ActiveRecord::Migration
   def up
    rename_column :suggestions, :outcome_id, :attainment_id
  end

  def down
    rename_column :suggestions, :attainment_id, :outcome_id
  end
end
