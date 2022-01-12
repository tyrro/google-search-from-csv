require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:keywords).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:email) }
end
