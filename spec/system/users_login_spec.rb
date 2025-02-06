require 'rails_helper'

RSpec.xdescribe 'サインアップ', type: :system do
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

    expect(page).to have_current_path(signup_path)

    expect(page).to have_content('Please fix the errors below.')
    expect(page).to have_content('The form contains 4 errors.')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Email can\'t be blank')
    expect(page).to have_content('Email is invalid')
    expect(page).to have_content('Password is too short (minimum is 6 characters)')

    expect(User.count).to eq user_count
  end

  it '有効な情報でサインアップできること' do
    user_count = User.count

    visit signup_path
    fill_in 'Name', with: 'Example User'
    fill_in 'Email', with: 'example@test.org'
    fill_in 'Password', with: 'P@ssw0rd'
    fill_in 'Confirmation', with: 'P@ssw0rd'
    click_button 'Create my account'

    expect(page).to have_current_path(user_path(User.last))

    expect(page).to have_content('Welcome to the Sample App!')
    expect(page).to have_content('Example User')

    expect(User.count).to eq user_count + 1
  end
end
