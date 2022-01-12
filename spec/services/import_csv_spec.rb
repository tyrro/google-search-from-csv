require 'rails_helper'

RSpec.describe ImportCsv do
  let(:user) { FactoryBot.create :user }
  let(:params) { { file: file } }
  let(:importer) { KeywordImport.new(user) }
  let(:csv_path) { Rails.root.join('spec', 'fixtures', 'valid_keyword.csv') }
  let(:file) do
    Rack::Test::UploadedFile.new(csv_path)
  end

  def call_service
    described_class.call(importer: importer, params: params)
  end

  describe '.call' do
    context 'when valid data is provided' do
      it 'returns success true' do
        expect(call_service.success?).to be_truthy
      end
    end
  end
end
