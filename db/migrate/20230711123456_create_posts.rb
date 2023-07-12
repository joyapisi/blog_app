class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :post do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :text
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0
      t.timestamps
    end

    add_index :post, :author_id
  end
end
