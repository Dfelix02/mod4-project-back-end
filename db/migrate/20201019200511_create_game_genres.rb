class CreateGameGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :game_genres do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
