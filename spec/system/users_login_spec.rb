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

      # ページ更新するとフラッシュメッセージが消えること
      visit login_path
      expect(page).not_to have_content('Invalid email/password combination')

      # パスワードが違うパターン
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'invalid_password'
      click_button 'Log in'

      expect(page).to have_current_path(login_path)

      # 成功パターン
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_current_path(user_path(user))

      expect(current_user_id).to eq(user.id)
      expect(page).to have_content(user.name)
      expect(page).not_to have_content('Log in')
      expect(page).to have_content('Users')
      expect(page).to have_content('Accont')
    end

    it 'ログイン済みユーザーがログインページにアクセスするとユーザー詳細ページにリダイレクトされること' do
    end
  end

  describe 'ログアウト' do
    it 'ログイン済みユーザーがログアウトできること' do
      log_in_as(user)

      click_link 'Account'
      click_link 'Log out'

      expect(status_code).to eq(303)
      expect(page).to have_current_path(root_path)
      expect(is_logged_in?).to be_falsey
      expect(page).to have_content('Log in')
      expect(page).not_to have_content('Users')
      expect(page).not_to have_content('Accont')
    end

    it '未ログインユーザーがログアウトページにアクセスするとルートページにリダイレクトされること' do
      vitit logout_path

      expect(status_code).to eq(303)
      expect(page).to have_current_path(root_path)
    end
  end
end
