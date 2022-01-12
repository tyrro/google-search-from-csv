require 'rails_helper'

RSpec.describe Queries::Paginate do
  let!(:entity) { double 'entity' }
  let(:relation) { double [entity] }
  subject(:call) { described_class.new(params: params, relation: relation).call }

  context 'no per_page specified' do
    let(:params) { { page: 1 } }
    it 'paginate is called with page 1 and per page 10' do
      expect(relation).to receive(:page).with(1).and_return(relation).ordered
      expect(relation).to receive(:per).with(10).and_return(relation).ordered
      call
    end
  end

  context 'per_page specified' do
    let(:params) { { page: 1, per_page: 5 } }
    it 'paginate is called with page 1 and per page 5' do
      expect(relation).to receive(:page).with(1).and_return(relation).ordered
      expect(relation).to receive(:per).with(5).and_return(relation).ordered
      call
    end
  end
end
