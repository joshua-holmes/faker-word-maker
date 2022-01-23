class CreateFavoriteWords < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_words do |t|
      t.belongs_to :lexicon, null: false, foreign_key: true
      t.string :word

      t.timestamps
    end
  end
end
