class AddAudioFieldToItems < ActiveRecord::Migration[5.1]
  def change
    add_attachment :items, :audio
  end
end
