require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    before(:each) do
      get '/users'
    end

    it 'Users index is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'Does not render wrong template' do
      expect(response).to_not render_template(:show)
    end
    it 'Response body includes correct placeholder text' do
      expect(response.body).to include('This is all users')
    end
  end

  context 'Show' do
    before(:each) do
      get '/users/1'
    end
    it 'Correct template was rendered' do
      expect(response).to render_template(:show)
    end
    it 'Response status was correct.' do
      expect(response).to have_http_status(:ok)
    end
    it 'Includes correct placeholder text.' do
      expect(response.body).to include('Here is a list of posts for specific user')
    end
  end
end
