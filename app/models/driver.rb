class Driver

  attr_accessor :query_hash, :query, :scraper, :num_array, :mean, :median, :mode, :url

  def initialize(query_hash)
    @query_hash = query_hash
  end

  def prepare_search
    @query = Query.new(query_hash)
    @scraper = Scraper.new(query)
  end

  def run_search
    scraper.scrape
    @num_array = scraper.number_extraction
    @url = scraper.encoded_url

    if !num_array.empty?
      analyzer = Analyzer.new(num_array)
      @mean = analyzer.mean
      @median = analyzer.median
      @mode = analyzer.mode
      return "Search Successful"
    else
      return "Search Returned No Results"
    end

  end

end