# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_comment_posts_counter
    post.update(posts_counter: post.comments.count)
  end
end
