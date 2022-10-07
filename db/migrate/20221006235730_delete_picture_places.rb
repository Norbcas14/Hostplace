class DeletePicturePlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :picture
  end
end
