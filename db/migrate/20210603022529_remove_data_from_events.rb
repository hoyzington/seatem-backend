class RemoveDataFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :data, :string
    remove_column :events, :description, :string
    add_column :events, :descriptions, :string
  end
end
