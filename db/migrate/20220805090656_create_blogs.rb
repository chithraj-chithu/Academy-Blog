class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.text :blog
      t.binary :images
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
