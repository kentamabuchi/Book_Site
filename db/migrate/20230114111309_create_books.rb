class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :category_id
      t.integer :genre_id
      t.string :createUser_id
      t.string :name, null: false
      t.string :writer, null:false
      t.string :image_id
      t.text :content
      t.boolean :edit_status, default:false
      t.boolean :is_active, default:true

      t.timestamps
    end
  end
end
