class SearchKeywordJob < ApplicationJob
  queue_as :default

  def perform(keyword_id)
    keyword = Keyword.find(keyword_id)
    result = SearchManagement::Workflow.call(keyword: keyword)

    if result.success?
      Rails.logger.info "#{keyword_id}: #{keyword.name} searched and parsed successfully"
    else
      Rails.logger.error "#{keyword_id}: #{keyword.name} searching failed"
      keyword.failed!
    end
  end
end
