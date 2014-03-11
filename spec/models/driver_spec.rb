require 'spec_helper'

describe "Driver" do

  let(:driver){ Driver.new({:search_query => "bicycle", :min_price => 100}) }

  it 'accepts a search query' do
    expect(driver.query_hash).to be_a(Hash)
  end

  before do
    driver.prepare_search
  end

  it 'created a query object' do
    expect(driver.query).to be_a(Query)
  end

  it 'created a scraper object' do
    expect(driver.scraper).to be_a(Scraper)
  end

  it 'knows the right query' do
    expect(driver.query.search_query).to eq("bicycle")
  end

end