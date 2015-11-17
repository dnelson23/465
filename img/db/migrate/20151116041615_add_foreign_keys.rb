class AddForeignKeys < ActiveRecord::Migration
  def change
    add_reference :images, :user, index: true, foreign_key: true

    add_reference :image_users, :image, index: true, foreign_key: true

    add_reference :image_users, :user, index: true, foreign_keyL: true

    add_reference :tags, :image, index: true, foreign_key: true
  end
end
