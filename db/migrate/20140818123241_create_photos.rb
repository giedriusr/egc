class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :gadget_id
      t.string :image

      t.timestamps
    end
    add_index :photos, :gadget_id
  end
end
