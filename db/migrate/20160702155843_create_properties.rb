class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.string :desc
      t.string :price
      t.string :image
      t.string :place

      t.timestamps null: false
    end
  end
end
