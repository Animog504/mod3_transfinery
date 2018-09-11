class CreateTranslationEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :translation_events do |t|

      t.timestamps
    end
  end
end
