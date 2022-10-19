class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes
  
    def update_post_counter
      author.posts_counter = author.posts.size
    end
  
    def five_recent_comments
      comments.last(5)
    end
end
