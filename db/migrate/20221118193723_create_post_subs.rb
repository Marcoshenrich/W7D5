class CreatePostSubs < ActiveRecord::Migration[7.0]
  def change
    create_table :postsubs do |t|
      t.references :post, null: false, foreign_key: true
      t.references :sub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
