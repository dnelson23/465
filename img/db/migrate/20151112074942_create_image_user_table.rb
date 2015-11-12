class CreateImageUserTable < ActiveRecord::Migration
  def change
    create_table :image_users do |t|

    end
    add_foreign_key :image_users, :images
    add_foreign_key :image_users, :users
  end
end
