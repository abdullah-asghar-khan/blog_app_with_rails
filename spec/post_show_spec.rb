require 'rails_helper'

RSpec.describe "PostShow", type: :feature do
  before :each do
    driven_by(:rack_test)
    @user = User.create(name: "Abdullah Khan", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails developer")
    @user2 = User.create(name: "Abdel Majid", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "React developer")

    @post = Post.create(author: @user, title: "Post 1", text: "This is the post")    
    Comment.create(author: @user, post: @post, text: "This is my first comment")
    Comment.create(author: @user2, post: @post, text: "This is my second comment")
    Like.create(post: @post, author: @user)
    visit user_post_path(@user, @post)   
  end

  it 'Shows the posts title' do
    expect(page).to have_content(@post.title)
  end

  it 'Display the post author' do
    expect(page).to have_content(@user.name)
  end

  it 'I can see how many comments the post has' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  it 'I can see how many likes the post has' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  it 'I can see the post text' do
    expect(page).to have_content(@post.text)
  end

  it 'shows username of each comment author' do
    comment = @post.comments.first
    expect(page).to have_content(comment.author.name)
  end

  it 'shows the comment each comment author left' do    
    comment = @post.comments.first
    comment2 = @post.comments.last
    expect(page).to have_content(comment.text)
    expect(page).to have_content(comment2.text)
  end
end
