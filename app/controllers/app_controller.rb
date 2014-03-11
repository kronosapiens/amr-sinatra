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
    binding.pry
    @driver.run_search
    binding.pry
    if !@driver.num_array.empty?
      erb :results
    else
      erb :noresults
    end
  end


end