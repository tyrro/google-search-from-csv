module SearchManagement
  class UpdateKeywordAttributes
    include Interactor

    delegate :keyword, :total_search_results_with_time_taken_text, :search_result_html,
             :total_adwords, :all_urls, to: :context

    def call
      keyword.update!(
        total_search_results_with_time_taken_text: total_search_results_with_time_taken_text,
        total_adwords: total_adwords,
        search_result_html: search_result_html,
        search_status: :successful,
        links_attributes: links_attributes,
      )
    end

    def links_attributes
      all_urls.map do |url|
        { url: url }
      end
    end
  end
end
