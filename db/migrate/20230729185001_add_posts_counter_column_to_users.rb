class AddPostsCounterColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_counter, :integer, default: 0
  end
end
