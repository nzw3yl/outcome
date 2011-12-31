class CreateProgressMetrics < ActiveRecord::Migration
  def change
    create_table :progress_metrics do |t|
      t.string :name
      t.boolean :direction
      t.string :code
      t.string :symbol
      t.string :lang_code

      t.timestamps
    end
  end
end
