class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter
    # author.posts_counter = author.posts.size
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order('created_at desc').limits(5)
  end
end
