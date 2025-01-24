require 'rails_helper'

RSpec.describe 'static_pagesコントローラのテスト', type: :request do
  describe 'homeページ（root）' do
    before do
      get root_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
    it 'タイトルが正しく表示されること' do
      expect(response.body).to include('<title>Home | Ruby on Rails Tutorial Sample App</title>')
    end
  end

  describe 'helpページ' do
    before do
      get static_pages_help_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
    it 'タイトルが正しく表示されること' do
      expect(response.body).to include('<title>Help | Ruby on Rails Tutorial Sample App</title>')
    end
  end

  describe 'aboutページ' do
    before do
      get static_pages_about_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
    it 'タイトルが正しく表示されること' do
      expect(response.body).to include('<title>About | Ruby on Rails Tutorial Sample App</title>')
    end
  end
end
