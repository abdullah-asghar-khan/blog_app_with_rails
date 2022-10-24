class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    post.likes_counter = post.likes.length
  end
end
