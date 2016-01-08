class SearchEngine
  def self.count_results(query)
    BingSearch.account_key = ENV.fetch('BING_APP_ID')
    results = BingSearch.composite query, [:web]
    results.web_total
  end
end
