require 'rails_helper'

RSpec.describe 'サインアップ', type: :system do
  it 'サインアップページにアクセスできること' do
    get root_url
    expect(page).to have_current_path(root_path)

    click_link 'Sign up now!'
    expect(page).to have_current_path(signup_path)
    exxpect(page).to have_content('<h1>Sign up</h1>')
  end

  it '無効な情報でサインアップするとエラーメッセージが表示されること' do
    user_count = User.count

    visit signup_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Confirmation', with: ''
    click_button 'Create my account'
    expect(page).to have_content('The form contains 4 errors.')

    expect(User.count).to eq user_count
  end
end
