require 'rails_helper'

RSpec.describe SearchKeywordJob, type: :job do
  let(:keyword) { FactoryBot.create(:keyword) }

  it 'matches with enqueued job' do
    expect { described_class.perform_later }.to have_enqueued_job(described_class).on_queue('default')
  end

  it 'searches the given keyword' do
    expect(SearchManagement::Workflow).to receive(:call).with(keyword: keyword).
      and_return(OpenStruct.new(success?: true))
    described_class.perform_now(keyword.id)
  end
end
