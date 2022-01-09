class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :name, null: false
      t.integer :search_status, default: 0, null: false
      t.integer :total_adwords
      t.integer :total_search_results
      t.float :total_search_time
      t.text :search_result_html
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
