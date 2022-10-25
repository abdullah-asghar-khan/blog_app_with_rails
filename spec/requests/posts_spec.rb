require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'Index' do
    before(:each) do
      get '/users/1/posts'
    end
    it 'Correct template was rendered.' do
      expect(response).to render_template(:index)
    end
    it 'Response status was correct.' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('This is all users posts')
    end
  end
  context 'Show' do
    before(:each) do
      get '/users/1/posts/1'
    end
    it 'Correct template was rendered.' do
      expect(response).to render_template(:show)
    end
    it 'Response status was correct.' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('This is specific post of specific users')
    end
  end
end
