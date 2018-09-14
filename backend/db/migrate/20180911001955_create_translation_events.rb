class CreateTranslationEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :translation_events do |t|
      t.string :from
      t.string :to
      t.string :origin
      t.string "iterations", array: true
      t.timestamps
    end
    add_index :translation_events, :iterations, using: :gin
  end
end
