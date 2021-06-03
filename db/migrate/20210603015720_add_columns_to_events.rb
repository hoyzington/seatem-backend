class AddColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :name, :string
    add_column :events, :table, :string
    add_column :events, :guestQty, :string
    add_column :events, :chairs, :string
    add_column :events, :guests, :string
    add_column :events, :description, :string
    add_column :events, :newlyAffectedGuests, :string
  end
end
