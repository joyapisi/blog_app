class AddPostsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    # Populate the posts_counter column with the current number of associated posts for each user
    User.reset_column_information
    User.find_each { |user| User.update_counters(user.id, posts_counter: user.posts.length) }

    add_column :posts, :comments_count, :integer, default: 0
    add_column :posts, :likes_count, :integer, default: 0

  end
end
