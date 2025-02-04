require 'rails_helper'

RSpec.describe 'usersコントローラのテスト', type: :request do
  describe 'newページ' do
    before do
      get signup_path
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
    it 'フォームが存在すること' do
      forms = [
        ['text', 'user[name]'],
        ['text', 'user[email]'],
        ['password', 'user[password]'],
        ['password', 'user[password_confirmation]']
      ]
      forms.each do |type, name|
        expect(response.body).to include "input type=\"#{type}\" name=\"#{name}\""
      end
      expect(response.body).to include 'input type="submit"'
    end
  end

  describe 'showページ' do
    let!(:user) { create(:user) }
    before do
      get user_path(user)
    end
    it 'レスポンスが200番を返すこと' do
      expect(response.status).to eq 200
    end
    it 'ユーザー名が表示されていること' do
      expect(response.body).to include user.name
    end
  end
end
