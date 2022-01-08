class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :name, null: false
      t.boolean :search_status, default: 0, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
