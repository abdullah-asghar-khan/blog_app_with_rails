require 'rails_helper'

RSpec.describe "UsersIndex", type: :feature do
    before :each do
        @user = User.create(name: "Example User", photo:"", bio: "Lorem ipsum")
        @user2 = User.create(name: "Example User2", photo:"", bio: "Lorem ipsum")
        @user3 = User.create(name: "Example User3", photo:"", bio: "Lorem ipsum")
    end
    it 'displays all users' do
        visit users_path
        expect(page).to have_content(@user.name)
        expect(page).to have_content(@user2.name)
        expect(page).to have_content(@user3.name)
    end
end
