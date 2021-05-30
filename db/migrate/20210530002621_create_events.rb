class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :data
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
