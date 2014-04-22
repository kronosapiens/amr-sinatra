class Driver

  attr_accessor :query_hash, :query, :scraper, :results

  Results = Struct.new(:mean, :median, :mode, :num_array, :url, :search_query)

  def initialize(query_hash)
    @query_hash = query_hash
  end

  def prepare_search
    @query = Query.new(query_hash)
    @scraper = Scraper.new(query)
  end

  def prepare_results
    @results = Results.new
    @results.search_query = query_hash["search_query"]
  end

  def run_search
    prepare_results
    scraper.scrape
    @results.num_array = scraper.number_extraction
    @results.url = scraper.encoded_url

    if !@results.num_array.empty?
      analyzer = Analyzer.new(@results.num_array)
      @results.mean = analyzer.mean
      @results.median = analyzer.median
      @results.mode = analyzer.mode
      return "Search Successful"
    else
      return "Search Returned No Results"
    end

  end

end