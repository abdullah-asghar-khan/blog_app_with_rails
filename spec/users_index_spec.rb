require 'rails_helper'

RSpec.describe "UsersIndex", type: :feature do
    before :each do
        @user = User.create(name: "Abdullah Khan", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails Developer")
        @user2 = User.create(name: "Abdel Majid", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails Developer")
        @user3 = User.create(name: "John doe", photo:"https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60", bio: "Rails Developer")
    end
    it 'displays all users' do
        visit users_path
        expect(page).to have_content(@user.name)
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user3.name)
    end
    it 'displays profile photo for each user' do
        visit users_path
        expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1664126409242-5390777fc5f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8RnpvM3p1T0hONnd8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60']")
    end
    it 'displays number of posts for each user' do
        visit users_path
        expect(page).to have_content(@user.posts.count)
        expect(page).to have_content(@user2.posts.count)
        expect(page).to have_content(@user3.posts.count)
    end
    it 'redirects to user profile page when user name is clicked' do
        visit users_path
        click_link(@user.name)
        expect(page).to have_current_path(user_path(@user.id))
    end
    
end
