require 'rails_helper'

RSpec.describe Queries::Search do
  let(:relation) { OpenStruct.new(search: nil) }
  let(:params) { { q: 'query' } }
  subject(:call) { described_class.new(params: params, relation: relation).call }

  it 'search is called with q' do
    expect(relation).to receive(:search).with(params[:q])
    call
  end
end
