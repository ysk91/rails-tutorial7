require 'rails_helper'

RSpec.describe 'static_pagesコントローラのテスト', type: :request do
  describe 'homeページ' do
    before do
      get static_pages_home_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
  end

  describe 'helpページにアクセスできること' do
    before do
      get static_pages_help_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
  end
end
