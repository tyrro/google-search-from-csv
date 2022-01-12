FactoryBot.define do
  factory :keyword do
    name { 'keyword' }
    search_status { :in_progress }
    total_search_results_with_time_taken_text { 'About 1000000 results in 0.001s' }
    total_adwords { 1 }
    search_result_html { '<div>search result</div>' }
    user
  end
end
