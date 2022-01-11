require 'httparty'

module SearchManagement
  class PerformSearch
    class GoogleSearchError < StandardError
      def initialize(keyword)
        @keyword = keyword
      end

      def to_s
        "keyword: #{@keyword} search failed"
      end
    end

    include Interactor
    GOOGLE_SEARCH_URL = 'https://www.google.com/search'
    delegate :keyword, :search_result_html, to: :context

    def call
      context.search_result_html = HTTParty.get(uri, { headers: { 'User-Agent' => user_agent } })
      fail GoogleSearchError, keyword unless search_result_html.response.code == '200'
    end

    def uri
      URI("#{GOOGLE_SEARCH_URL}?q=#{CGI.escape(keyword.name)}")
    end

    def user_agent
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/605.1.15 (KHTML, like Gecko) '\
      'Version/11.1.2 Safari/605.1.15'
    end
  end
end
