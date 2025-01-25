require 'rails_helper'

RSpec.describe 'usersコントローラのテスト', type: :request do
  describe 'newページ' do
    before do
      get signup_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
  end
end
