require 'spec_helper'

describe 'app_controller' do

  describe 'get /' do
    before do
      get '/'
    end

    it 'serves up a homepage' do
      expect(last_response.status).to eq(200)
    end

    it 'loads index.erb correctly' do
      expect(last_response.body).to include("Welcome to AfterMarket Research")
    end

    it 'loads index.erb correctly' do
      expect(last_response.body).to include("Brooklyn")
    end

  end

  describe 'post /search' do
    before do
      post '/search', { :search =>
        {:keyword => "brk",
         :query => "macbook pro",
         :min => 100,
         :max => 2000}
      }
    end

    it 'shows search results' do
      expect(last_response.body).to include("Analysis Complete")
    end
  end



end