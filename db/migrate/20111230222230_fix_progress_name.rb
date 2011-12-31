class FixProgressName < ActiveRecord::Migration
  def up
    rename_column :attainments, :progress_id, :progress_metric_id
  end

  def down
    rename_column :attainments,  :progress_metric_id, :progress_id
  end
end
