class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :firstName
      t.string :middleName
      t.string :lastName
      t.string :neighbors
      t.string :guestsYes
      t.string :guestsNo
      t.string :descriptionsYes
      t.string :descriptionsNo
      t.string :traits
      t.boolean :seated
      t.string :issues
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
