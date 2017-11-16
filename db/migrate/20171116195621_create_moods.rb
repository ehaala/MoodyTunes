class CreateMoods < ActiveRecord::Migration[5.1]
  def change
    create_table :moods do |t|
      t.string :image
      t.string :anger
      t.string :contempt
      t.string :disgust
      t.string :fear
      t.string :sadness
      t.string :happiness
      t.string :neutral
      t.string :surprise
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
