class AddFieldsToAudios < ActiveRecord::Migration[5.1]
  def change
    add_column :audios, :name, :string
    add_column :audios, :path, :string

    add_index :audios, :name
  end
end
