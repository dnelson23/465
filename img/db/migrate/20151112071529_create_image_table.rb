class CreateImageTable < ActiveRecord::Migration
  def change
    create_table :images do |t|
        t.string :filename
        t.boolean :private

        t.timestamps
    end
  end
end