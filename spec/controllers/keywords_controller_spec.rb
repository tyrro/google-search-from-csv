require 'rails_helper'

RSpec.describe KeywordsController, type: :controller do
  before do
    sign_in_as user
  end

  let(:user) { FactoryBot.create :user }
  let!(:keyword) { FactoryBot.create :keyword, user: user }
  let(:keyword_attributes) do
    {
      id: keyword.id,
      name: keyword.name,
      search_status: keyword.search_status.titleize,
      total_search_results_with_time_taken_text: keyword.total_search_results_with_time_taken_text,
      total_adwords: keyword.total_adwords,
      total_links: keyword.links.count,
      search_result_html_path: keyword_path(keyword),
      search_completed: keyword.search_completed?,
    }
  end

  let(:pagination) do
    {
      total_pages: 1,
      total_count: 1,
      current_page: 1,
    }
  end

  describe 'GET #index' do
    describe 'JSON format' do
      render_views

      it 'returns the list of keywords in JSON' do
        get :index, params: { format: :json }

        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          keywords: [keyword_attributes],
          pagination: pagination,
        )
      end
    end

    describe 'search and pagination' do
      render_views

      it 'returns only the searched keyword' do
        get :index, params: { format: :json, q: keyword.name }

        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          keywords: [keyword_attributes],
          pagination: pagination,
        )
      end

      it 'returns no keyword if searched keyword not found' do
        get :index, params: { format: :json, q: 'unknown_keyword' }

        expect(JSON.parse(response.body, symbolize_names: true)).to eq(
          keywords: [],
          pagination: {
            total_pages: 0,
            total_count: 0,
            current_page: 1,
          },
        )
      end
    end
  end

  describe 'POST #import' do
    let(:file) { Rack::Test::UploadedFile.new(file_path) }

    context 'when a valid CSV is uploaded' do
      let(:file_path) { Rails.root.join('spec', 'fixtures', 'valid_keyword.csv') }

      it 'returns no error' do
        post :import, params: { file: file }
        expect(JSON.parse(response.body)).to eq({ 'error' => nil })
      end
    end
  end
end
