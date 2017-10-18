class AddPathToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :path, :string
  end
end
