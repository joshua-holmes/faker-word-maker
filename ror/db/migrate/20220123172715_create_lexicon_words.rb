class CreateLexiconWords < ActiveRecord::Migration[7.0]
  def change
    create_table :lexicon_words do |t|
      t.belongs_to :lexicon, null: false, foreign_key: true
      t.belongs_to :word, null: false, foreign_key: true

      t.timestamps
    end
  end
end
