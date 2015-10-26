class AddReferencesTable < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :url
      t.references :topic, index: true, foreigh_key: true
      t.timestamps null: true
    end
    add_foreign_key :references, :topics 
  end
end
