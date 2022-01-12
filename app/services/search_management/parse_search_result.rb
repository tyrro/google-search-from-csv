module SearchManagement
  class ParseSearchResult
    include Interactor

    RESULT_STATS_ID = 'result-stats'
    TOP_ADS_ID = 'tads'
    ALL_LINKS = 'a[href]'
    delegate :search_result_html, to: :context

    def call
      context.total_search_results_with_time_taken_text = total_search_results_with_time_taken_text
      context.total_adwords = total_adwords
      context.all_urls = all_urls
    end

    def document
      @document ||= Nokogiri::HTML(search_result_html)
    end

    def total_search_results_with_time_taken_text
      document.css("##{RESULT_STATS_ID}").first.children.map(&:text).to_sentence
    end

    def total_adwords
      document.css("##{TOP_ADS_ID}").count
    end

    def all_urls
      document.css(ALL_LINKS.to_s).map { |a_tag| a_tag['href'] }
    end
  end
end
