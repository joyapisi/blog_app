class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :like do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true
      t.timestamps
    end

    add_index :like, %i[author_id post_id], unique: true
  end
end
