# frozen_string_literal: true

class CreateBlogReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_reactions do |t|
      t.binary :reaction
      t.references :user, null: false, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.references :blog, null: false, foreign_key: { on_delete: :cascade, on_update: :cascade }

      t.timestamps
    end
  end
end
