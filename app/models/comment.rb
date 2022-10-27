class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comments_counter

  def update_comments_counter
    # post.comments_counter = post.comments.size
    post.increment!(:comments_counter
  end
end
