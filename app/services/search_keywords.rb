class SearchKeywords
  include Interactor

  delegate :keywords, to: :context

  def call
    keywords.each_with_index do |keyword, index|
      SearchKeywordJob.set(wait: index * 2).perform_later(keyword.id)
    end
  end
end
