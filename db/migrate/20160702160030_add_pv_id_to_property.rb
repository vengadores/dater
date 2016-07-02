class AddPvIdToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :pv_id, :string
  end
end
