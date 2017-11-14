class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
