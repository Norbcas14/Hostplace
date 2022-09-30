class RenamePictureColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column(:places, :picture)
    add_column(:places, :picture, :string)
  end
end
