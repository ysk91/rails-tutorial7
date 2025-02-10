require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) }

  it 'current_user' do
    log_in(user)
    remember(user)
    expect(current_user).to eq user
    expect(logged_in?).to be_truthy
  end

  xit 'log_out' do
    log_in(user)
    remember(user)
    log_out # reset_sessionができない
    expect(current_user).to be_nil
    expect(logged_in?).to be_falsey
  end
end
