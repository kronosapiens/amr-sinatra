class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions


  get '/' do
    @locations_hash = Query.keywords
    erb :index
  end

  post '/search' do
    @driver = Driver.new(params[:search])
    @driver.prepare_search
    @driver.run_search
    if !@driver.num_array.empty?
      erb :results
    else
      erb :noresults
    end
  end


end