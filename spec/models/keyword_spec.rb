require 'rails_helper'

RSpec.describe Keyword, type: :model do
  it { is_expected.to have_many(:links).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to accept_nested_attributes_for(:links) }
end
