require 'rails_helper'

RSpec.describe 'UsersIndex', type: :feature do
  before :each do
    @user = User.create(name: 'Abdullah Khan',
                        photo: 'shrtco.de/do7AF4', bio: 'Rails developer')
    @user2 = User.create(name: 'Abdel Majid',
                         photo: 'shrtco.de/do7AF4', bio: 'React developer')
    @user3 = User.create(name: 'John doe',
                         photo: 'shrtco.de/do7AF4')
  end
  it 'displays all users' do
    visit users_path
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user3.name)
  end
  it 'displays profile photo for each user' do
    visit users_path
    expect(page).to have_css("img[src*='shrtco.de/do7AF4']")
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
