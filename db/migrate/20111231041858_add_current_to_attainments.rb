class AddCurrentToAttainments < ActiveRecord::Migration
  def change
    add_column :attainments, :current, :integer
  end
end
