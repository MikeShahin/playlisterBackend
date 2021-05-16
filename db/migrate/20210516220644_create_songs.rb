class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :songName
      t.string :preview
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
