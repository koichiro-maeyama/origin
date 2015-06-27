class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.string :publisher

      t.timestamps null: false
    end
  end
end
