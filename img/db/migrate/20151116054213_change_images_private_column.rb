class ChangeImagesPrivateColumn < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.rename :private, :is_private
    end
  end
end
