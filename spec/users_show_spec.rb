require 'rails_helper'

RSpec.describe "UsersShow", type: :feature do
    before :each do
        @user = User.create(name: "Abdullah Khan", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails developer")
        @user2 = User.create(name: "Abdel Majid", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "React developer")
        @user3 = User.create(name: "John doe", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Full stack developer")

        5.times do |i|
          Post.create(author: @user, title: "Post #{i}", text: "This is the first post")
        end
        visit user_path(@user.id)    
      end

    it 'displays profile photo for each user' do       
        expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60']")
    end

    it 'displays users unsername' do       
        expect(page).to have_content(@user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it 'Can see the users bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'I can see the user’s first 3 posts.' do
      expect(page).to have_content('Post 4')
      expect(page).to have_content('Post 3')
      expect(page).to have_content('Post 2')
    end

    it 'See a button to view all posts written by the user.' do
      expect(page).to have_link('See all posts')
    end

    it 'Click on users post and see the post details' do
      click_link('Post 4')
      expect(page).to have_content('Post 4')
      expect(page).to have_content('This is the first post')
    end
end