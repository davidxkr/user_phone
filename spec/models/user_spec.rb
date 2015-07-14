require 'rails_helper'

describe User, 'Attributes' do
  it { respond_to :name }
end

describe User, 'Relations' do
  it { expect(subject).to have_many(:phones) }
  it { expect(subject).to have_one(:address) }
end