require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', posts_counter: 0)
    @first_user.save
  end
  context 'Users validations' do
    it 'Name must be present and not blank.' do
      @first_user.name = ''
      expect(@first_user).to_not be_valid
    end

    it 'PostsCounter must be an integer greater than or equal to zero.' do
      @first_user.posts_counter = -10
      expect(@first_user).to_not be_valid
    end

    it 'validate recent_posts method' do
      post_one = Post.new(author: @first_user, title: 'First post', text: 'First post by first user',
                          comments_counter: 0, likes_counter: 0)
      post_one.save
      second_post = Post.new(author: @first_user, title: 'Second post', text: 'Second post by first user',
                             comments_counter: 0, likes_counter: 0)
      second_post.save
      third_post = Post.new(author: @first_user, title: 'Third post', text: 'Third post by first user',
                            comments_counter: 0, likes_counter: 0)
      third_post.save
      fourth_post = Post.new(author: @first_user, title: 'Fourth post', text: 'Fourth post by first user',
                             comments_counter: 0, likes_counter: 0)
      fourth_post.save
      expect(@first_user.last_three_posts).to eq([fourth_post, third_post, second_post])
    end
  end
end
