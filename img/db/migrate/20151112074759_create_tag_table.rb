class CreateTagTable < ActiveRecord::Migration
  def change
    create_table :tags do |t|
        t.string :str
    end

    add_foreign_key :tags, :users
  end
end
