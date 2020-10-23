class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :released
      t.string :background_image
      t.float :rating
      t.float :rating_top
      t.float :playtime
      t.string :clip
      t.string :clip_preview
      t.string :screenshots, array: true, default: []
      t.float :price

      t.timestamps
    end
  end
end
