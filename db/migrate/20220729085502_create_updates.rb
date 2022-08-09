class CreateUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :updates do |t|
      t.string :updates
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
