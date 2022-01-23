class CreateLexicons < ActiveRecord::Migration[7.0]
  def change
    create_table :lexicons do |t|
      t.string :name

      t.timestamps
    end
  end
end
