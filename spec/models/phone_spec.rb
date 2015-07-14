require 'rails_helper'

describe Phone, 'Attributes' do
  it { respond_to :number }
  it { respond_to :user_id }
end

describe Phone, 'Relations' do
  it { expect(subject).to belong_to(:user) }
end