class CreateAttainments < ActiveRecord::Migration
  def change
    create_table :attainments do |t|
      t.string :name
      t.text :reason
      t.datetime :due_date
      t.integer :progress_id
      t.integer :target
      t.integer :user_id
      t.string :code
      t.boolean :public

      t.timestamps
    end
  end
end
