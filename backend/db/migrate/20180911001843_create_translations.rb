class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string "from"
      t.string "to"
      t.string "origin"
      t.string "text"
      t.belongs_to :translation_event
      t.timestamps
    end
  end
end
