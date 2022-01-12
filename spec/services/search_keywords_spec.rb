require 'rails_helper'

RSpec.describe SearchKeywords do
  let(:keyword) { FactoryBot.create(:keyword) }
  let(:search_keyword_job_double) { double(SearchKeywordJob) }

  def call_service
    described_class.call(keywords: [keyword])
  end

  it 'schedules a job to search the keyword' do
    expect(SearchKeywordJob).to receive(:set).with(wait: 0).and_return(search_keyword_job_double)
    expect(search_keyword_job_double).to receive(:perform_later).with(keyword.id)
    call_service
  end
end
