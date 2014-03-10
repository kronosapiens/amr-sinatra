# require_relative '../spec_helper'
require 'spec_helper'

describe 'app_controller' do

  describe 'get /' do

    it 'serves up a homepage' do
      get '/'
      expect(last_response.status).to eq(200)
    end

    it 'loads index.erb correctly' do
      get '/'
      expect(last_response.body).to include("Welcome to AfterMarket Research")
    end

  end


end