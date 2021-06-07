class RemoveGuestsFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :guests, :string
  end
end
