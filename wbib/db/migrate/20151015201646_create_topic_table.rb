class CreateTopicTable < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :title
      t.string :description
    end
  end

  def down
    drop_table :topics
  end
end
