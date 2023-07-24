class AddPostsCountToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_count, :integer, default: 0

    # This line will populate the posts_count column with the current number of associated posts for each user
    User.reset_column_information
    User.find_each { |user| User.update_counters(user.id, posts_count: user.posts.length) }
  end
end
