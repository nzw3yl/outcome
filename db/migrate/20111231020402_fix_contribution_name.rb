class FixContributionName < ActiveRecord::Migration
  def up
    rename_column :contributions, :outcome_id, :attainment_id
  end

  def down
    rename_column :contributions, :attainment_id, :outcome_id
  end
end
