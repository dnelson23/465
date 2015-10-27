class CreateTopicTable < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end

  def down
    drop_table :topics
  end
end
