class SearchKeywordsJob < ApplicationJob
  queue_as :default

  def perform(keyword_ids)
    keyword_ids.each_with_index do |keyword_id, index|
      SearchKeywordJob.set(wait: index * 2).perform_later(keyword_id)
    end
  end
end
