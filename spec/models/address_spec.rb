require 'rails_helper'

describe Address, 'Attributes' do
  it { respond_to :line1 }
  it { respond_to :zip }
  it { respond_to :user_id }
end

describe Address, 'Relations' do
  it { expect(subject).to belong_to(:user) }
end