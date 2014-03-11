class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    @locations_hash = Query.keywords
    erb :index
  end

  post '/search' do
    @query = Query.new(params[:search])
    @scraper = Scraper.new(@query)
    @scraper.scrape
    if @scraper.product_rows.length > 0
      @analyzer = Analyzer.new(@scraper.number_extraction)
    else
      puts "Sorry, your search returned no results."
    end
  end


end