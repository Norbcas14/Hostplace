class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :places, :picture, :picture_data
  end
end
