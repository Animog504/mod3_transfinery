class CreateTranslationEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :translation_events do |t|
      t.string "from"
      t.string "to"
      t.string "origin"
      t.string "text"
      t.timestamps
    end
  end
end
