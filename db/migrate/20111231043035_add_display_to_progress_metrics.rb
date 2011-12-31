class AddDisplayToProgressMetrics < ActiveRecord::Migration
  def change
    add_column :progress_metrics, :display, :string
  end
end
