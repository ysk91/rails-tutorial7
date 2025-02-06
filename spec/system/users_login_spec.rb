require 'rails_helper'

RSpec.xdescribe 'Sessions', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン' do
    it '未ログインユーザーがログインできること' do
      visit login_path

      # 失敗パターン
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'

      expect(page).to have_current_path(login_path)
      expect(page).to have_content('Invalid email/password combination')

      visit login_path
      expect(page).not_to have_content('Invalid email/password combination')

      # 成功パターン
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_current_path(user_path(user))
      expect(page).to have_content('Welcome back!')
    end

    it 'ログイン済みユーザーがログインページにアクセスするとユーザー詳細ページにリダイレクトされること' do

    end
  end
end
